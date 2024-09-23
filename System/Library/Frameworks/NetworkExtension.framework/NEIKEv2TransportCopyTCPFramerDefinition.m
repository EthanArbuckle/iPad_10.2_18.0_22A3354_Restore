@implementation NEIKEv2TransportCopyTCPFramerDefinition

void __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke()
{
  nw_protocol_definition_t definition;
  void *v1;

  definition = nw_framer_create_definition("IKE-TCP", 0, &__block_literal_global_12);
  v1 = (void *)NEIKEv2TransportCopyTCPFramerDefinition_definition;
  NEIKEv2TransportCopyTCPFramerDefinition_definition = (uint64_t)definition;

}

uint64_t __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;

  v2 = a2;
  nw_framer_set_input_handler(v2, &__block_literal_global_13);
  nw_framer_set_output_handler(v2, &__block_literal_global_15_12878);
  nw_framer_write_output(v2, (const uint8_t *)"IKETCP", 6uLL);

  return 1;
}

void __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke_14(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  unsigned __int16 v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t output_buffer[2];
  int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4 + 6;
  *(_WORD *)output_buffer = bswap32(a4 + 6) >> 16;
  v9 = 0;
  v6 = a2;
  nw_framer_write_output(v6, output_buffer, 6uLL);
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v11 = v5;
    v12 = 1024;
    v13 = v9;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "IKE-TCP: Writing frame of length %u for SPI %04X", buf, 0xEu);
  }

  nw_framer_write_output_no_copy(v6, a4);
}

uint64_t __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  _QWORD parse[4];
  NSObject *v12;
  uint64_t *v13;
  uint8_t temp_buffer[4];
  __int16 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15 = 0;
    *(_DWORD *)temp_buffer = 0;
    parse[0] = v4;
    parse[1] = 3221225472;
    parse[2] = __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke_4;
    parse[3] = &unk_1E3CC1A68;
    v13 = &v16;
    v5 = v3;
    v12 = v5;
    if (nw_framer_parse_input(v5, 6uLL, 6uLL, temp_buffer, parse))
    {
      if (*((_DWORD *)v17 + 6))
      {
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v9 = *((_DWORD *)v17 + 6);
          *(_DWORD *)buf = 67109376;
          v21 = v9;
          v22 = 1024;
          v23 = 0;
          _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "IKE-TCP: Reading frame of length %u for SPI %04X", buf, 0xEu);
        }

        v7 = nw_framer_message_create(v5);
        v8 = nw_framer_deliver_input_no_copy(v5, *((unsigned int *)v17 + 6), v7, 1);

        if (!v8)
          v2 = 0;
      }
      else
      {
        LOBYTE(v8) = 0;
        v2 = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
      v2 = 6;
    }

    _Block_object_dispose(&v16, 8);
  }
  while (v8);

  return v2;
}

uint64_t __NEIKEv2TransportCopyTCPFramerDefinition_block_invoke_4(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  result = 0;
  v10 = *MEMORY[0x1E0C80C00];
  if (a2 && a3 >= 6)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = bswap32(*a2) >> 16;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_DWORD *)(v5 + 24);
    if (v6 > 5)
    {
      if (*(_DWORD *)(a2 + 1))
      {
        *(_DWORD *)(v5 + 24) = v6 - 2;
        return 2;
      }
      else
      {
        *(_DWORD *)(v5 + 24) = v6 - 6;
        return 6;
      }
    }
    else
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v9[0] = 67109120;
        v9[1] = v8;
        _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "IKE-TCP: Received invalid frame length %u", (uint8_t *)v9, 8u);
      }

      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 40);
      return 0;
    }
  }
  return result;
}

@end
