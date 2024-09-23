@implementation NEIKEv2RTT

- (NEIKEv2RTT)init
{
  NEIKEv2RTT *v2;
  NEIKEv2RTT *v3;
  NEIKEv2RTT *v4;
  NSObject *v6;
  __int16 v7[8];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2RTT;
  v2 = -[NEIKEv2RTT init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_rxt_cur = 1000;
    v2->_lastRequestMessageID = -1;
    v2->_rtt_cur = 0;
    v2->_srtt = 0;
    *(_OWORD *)&v2->_rtt_var = xmmword_19BED74B0;
    *(_OWORD *)&v2->_rtt_min = xmmword_19BED74C0;
    v2->_rxt_shift = 0;
    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v7, 2u);
    }

  }
  return v3;
}

- (BOOL)getCurrentTime:(uint64_t)a1
{
  uint64_t v2;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (getCurrentTime__onceToken != -1)
      dispatch_once(&getCurrentTime__onceToken, &__block_literal_global_24026);
    v2 = mach_continuous_time() * getCurrentTime__tb_info / *(unsigned int *)algn_1EE412D4C;
    *(_QWORD *)a1 = v2 / 0x3B9ACA00;
    *(_DWORD *)(a1 + 8) = v2 % 0x3B9ACA00 / 0x3E8;
  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "-[NEIKEv2RTT getCurrentTime:]";
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "%s called with null now", (uint8_t *)&v5, 0xCu);
    }

  }
  return a1 != 0;
}

uint64_t __29__NEIKEv2RTT_getCurrentTime___block_invoke()
{
  uint64_t result;
  NSObject *v1;
  int v2;
  uint8_t buf[4];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = mach_timebase_info((mach_timebase_info_t)&getCurrentTime__tb_info);
  if ((_DWORD)result)
  {
    v2 = result;
    ne_log_obj();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v4 = v2;
      _os_log_fault_impl(&dword_19BD16000, v1, OS_LOG_TYPE_FAULT, "mach_timebase_info returned %u", buf, 8u);
    }

    abort();
  }
  return result;
}

- (uint64_t)resetRTTMeasurement
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(result + 24);
  if (!v1 && *(unsigned __int16 *)(result + 8) >= 2u)
    *(_QWORD *)(result + 32) = 12000;
  v2 = *(_QWORD *)(result + 48);
  v3 = *(_QWORD *)(result + 32) + (v1 >> 3);
  if (v2 <= v3 >> 2)
    v4 = v3 >> 2;
  else
    v4 = *(_QWORD *)(result + 48);
  *(_QWORD *)(result + 64) = v4;
  if (v4 < v2)
    goto LABEL_10;
  if (v4 >= 0xFA01)
  {
    v2 = 64000;
LABEL_10:
    *(_QWORD *)(result + 64) = v2;
  }
  *(_QWORD *)(result + 40) = 0;
  *(_WORD *)(result + 8) = 0;
  *(_DWORD *)(result + 12) = -1;
  return result;
}

- (void)updateRTT:(int)a3 responseMessageID:
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 12) == a3)
    {
      if (*(unsigned __int16 *)(a1 + 8) >= 2u)
        goto LABEL_4;
      v21 = 0;
      v22 = 0;
      if (-[NEIKEv2RTT getCurrentTime:]((uint64_t)&v21))
      {
        v8 = ((int)v22 / 1000);
        v9 = 1000 * v21 - *(_QWORD *)(a1 + 40);
        v10 = v9 + v8;
        if ((int)v9 + (int)v8 >= 1)
        {
          ++*(_QWORD *)(a1 + 56);
          *(_QWORD *)(a1 + 16) = (v9 + v8);
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v5;
            v25 = 1024;
            v26 = v10;
            _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_INFO, "%@, current rtt %u", buf, 0x12u);
          }

          v12 = *(_QWORD *)(a1 + 24);
          if (v12)
          {
            v13 = 4 * v10 - (v12 >> 3);
            v14 = v12 + (int)v13;
            if (v14 <= 1)
              v14 = 1;
            if ((int)v13 < 0)
              LODWORD(v13) = -(int)v13;
            v15 = *(_QWORD *)(a1 + 32) + (int)(v13 - (*(_QWORD *)(a1 + 32) >> 2));
            if (v15 <= 1)
              v16 = 1;
            else
              v16 = v15;
          }
          else
          {
            v14 = 32 * (int)v10;
            v16 = 8 * (int)v10;
          }
          *(_QWORD *)(a1 + 24) = v14;
          *(_QWORD *)(a1 + 32) = v16;
          v18 = *(_QWORD *)(a1 + 48);
          v19 = v16 + (v14 >> 3);
          if (v18 <= v19 >> 2)
            v20 = v19 >> 2;
          else
            v20 = *(_QWORD *)(a1 + 48);
          *(_QWORD *)(a1 + 64) = v20;
          if (v20 >= v18)
          {
            if (v20 < 0xFA01)
              goto LABEL_4;
            v18 = 64000;
          }
          *(_QWORD *)(a1 + 64) = v18;
        }
LABEL_4:
        -[NEIKEv2RTT resetRTTMeasurement](a1);
        goto LABEL_8;
      }
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "%@, failed to update RTT", buf, 0xCu);
      }

    }
    else
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_DWORD *)(a1 + 12);
        *(_DWORD *)buf = 138412802;
        v24 = v5;
        v25 = 1024;
        v26 = a3;
        v27 = 1024;
        v28 = v7;
        _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@, response message ID(%u) != request message ID(%u)", buf, 0x18u);
      }

    }
  }
LABEL_8:

}

- (unint64_t)nextRetransmissionInterval
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32) + (*(_QWORD *)(a1 + 24) >> 3);
  if (v1 <= v2 >> 2)
    v3 = v2 >> 2;
  else
    v3 = *(_QWORD *)(a1 + 48);
  v4 = *(unsigned __int16 *)(a1 + 8);
  v5 = v3 * IKEV2_SESSION_RXMT_BACKOFF[*(unsigned __int16 *)(a1 + 8)];
  *(_QWORD *)(a1 + 64) = v5;
  if (v5 >= v1)
  {
    if (v5 < 0xFA01)
      goto LABEL_9;
    v1 = 64000;
  }
  *(_QWORD *)(a1 + 64) = v1;
  v5 = v1;
LABEL_9:
  if (v4 <= 0xB)
    *(_WORD *)(a1 + 8) = v4 + 1;
  return v5;
}

@end
