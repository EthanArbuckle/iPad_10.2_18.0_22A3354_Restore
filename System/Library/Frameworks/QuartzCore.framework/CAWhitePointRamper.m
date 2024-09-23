@implementation CAWhitePointRamper

- (CAWhitePointRamper)initWithDisplay:(id)a3
{
  CAWhitePointRamper *v3;
  double v4;
  CAWhitePointRamper *v5;
  double v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAWhitePointRamper;
  v3 = -[CAWindowServerRamper initWithDisplay:](&v8, sel_initWithDisplay_, a3);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 2143289344;
    -[CAWhitePointRamper setScaleEnd:](v3, "setScaleEnd:", v4);
    LODWORD(v6) = 2143289344;
    -[CAWhitePointRamper setScaleStart:](v5, "setScaleStart:", v6);
  }
  return v5;
}

- (void)rampCallback:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  double v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  CAWindowServerDisplay *v39;
  double v40;
  CAWindowServerDisplay *v41;
  NSObject *v42;
  int v43;
  uint64_t v44;
  __CFRunLoop *Current;
  NSObject *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  int v53;
  float v54;
  _OWORD v55[2];
  int v56;
  _OWORD v57[2];
  int v58;
  uint8_t buf[32];
  int v60;
  __int128 v61;
  __int128 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[CAWindowServerRamper beginTime](self, "beginTime");
  if (v5 <= 0.0)
  {
    objc_msgSend(a3, "targetTimestamp");
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(a3, "targetTimestamp");
  v7 = v6;
  -[CAWindowServerRamper beginTime](self, "beginTime");
  v9 = v7 - v8;
  -[CAWindowServerRamper duration](self, "duration");
  if (v9 / v10 > 1.0
    || (objc_msgSend(a3, "targetTimestamp"),
        v12 = v11,
        -[CAWindowServerRamper beginTime](self, "beginTime"),
        v14 = v12 - v13,
        -[CAWindowServerRamper duration](self, "duration"),
        v16 = 0.0,
        v14 / v15 >= 0.0))
  {
    objc_msgSend(a3, "targetTimestamp");
    v18 = v17;
    -[CAWindowServerRamper beginTime](self, "beginTime");
    v20 = v18 - v19;
    -[CAWindowServerRamper duration](self, "duration");
    v16 = 1.0;
    if (v20 / v21 <= 1.0)
    {
      objc_msgSend(a3, "targetTimestamp");
      v23 = v22;
      -[CAWindowServerRamper beginTime](self, "beginTime");
      v25 = v23 - v24;
      -[CAWindowServerRamper duration](self, "duration");
      v16 = v25 / v26;
    }
  }
  -[CAWhitePointRamper scaleStart](self, "scaleStart");
  v28 = v27;
  -[CAWhitePointRamper scaleEnd](self, "scaleEnd");
  v30 = v29;
  -[CAWhitePointRamper scaleStart](self, "scaleStart");
  v31 = 0;
  v33 = v16 * (float)(v30 - v32);
  do
  {
    if (self)
    {
      -[CAWhitePointRamper whitePointStart](self, "whitePointStart");
      v34 = *(float *)&buf[v31];
      -[CAWhitePointRamper whitePointEnd](self, "whitePointEnd");
      v35 = *(float *)((char *)v57 + v31);
      -[CAWhitePointRamper whitePointStart](self, "whitePointStart");
    }
    else
    {
      v60 = 0;
      memset(buf, 0, sizeof(buf));
      v34 = *(float *)&buf[v31];
      v58 = 0;
      memset(v57, 0, sizeof(v57));
      v35 = *(float *)((char *)v57 + v31);
      v56 = 0;
      memset(v55, 0, sizeof(v55));
    }
    v36 = v34 + v16 * (float)(v35 - *(float *)((char *)v55 + v31));
    *(float *)((char *)&v61 + v31) = v36;
    v31 += 4;
  }
  while (v31 != 36);
  v37 = v33 + v28;
  if ((LODWORD(v37) & 0x7FFFFFFFu) >= 0x7F800000)
    v38 = 1.0;
  else
    v38 = v33 + v28;
  v39 = -[CAWindowServerRamper display](self, "display");
  *(float *)&v40 = v38;
  -[CAWindowServerDisplay setWhitePointMatrix:scale:](v39, "setWhitePointMatrix:scale:", &v61, v40);
  *(_QWORD *)&v57[0] = 0;
  v41 = -[CAWindowServerRamper display](self, "display");
  v50[1] = 3221225472;
  v51 = v61;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[2] = __35__CAWhitePointRamper_rampCallback___block_invoke;
  v50[3] = &unk_1E159DB30;
  v52 = v62;
  v53 = v63;
  v50[4] = self;
  v54 = v38;
  if (!-[CAWindowServerDisplay commitBrightness:withBlock:](v41, "commitBrightness:withBlock:", v57, v50))
  {
    if (x_log_hook_p())
    {
      v48 = -[CAWindowServerRamper id](self, "id");
      v49 = objc_msgSend((id)objc_msgSend(*(id *)&v57[0], "localizedDescription"), "UTF8String");
      x_log_();
    }
    else
    {
      v42 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        v43 = -[CAWindowServerRamper id](self, "id");
        v44 = objc_msgSend((id)objc_msgSend(*(id *)&v57[0], "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = v44;
        _os_log_impl(&dword_184457000, v42, OS_LOG_TYPE_ERROR, "WhitePoint ramp %d: Error setting whitepoint: %s", buf, 0x12u);
      }
    }
    -[CADisplayLink invalidate](-[CAWindowServerRamper link](self, "link", v48, v49), "invalidate");
  }
  if (v16 == 1.0)
  {
    objc_msgSend(a3, "invalidate");
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (x_log_hook_p())
    {
      -[CAWindowServerRamper id](self, "id");
      x_log_();
    }
    else
    {
      v46 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        v47 = -[CAWindowServerRamper id](self, "id");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v47;
        _os_log_impl(&dword_184457000, v46, OS_LOG_TYPE_DEFAULT, "WhitePoint ramp %d: Complete", buf, 8u);
      }
    }
  }
}

- ($7FC4C79D0826BB61D2B795282A69B861)whitePointStart
{
  $7FC4C79D0826BB61D2B795282A69B861 *result;

  objc_copyStruct(retstr, &self->_whitePointStart, 36, 1, 0);
  return result;
}

- (void)setWhitePointStart:(id *)a3
{
  objc_copyStruct(&self->_whitePointStart, a3, 36, 1, 0);
}

- ($7FC4C79D0826BB61D2B795282A69B861)whitePointEnd
{
  $7FC4C79D0826BB61D2B795282A69B861 *result;

  objc_copyStruct(retstr, &self->_whitePointEnd, 36, 1, 0);
  return result;
}

- (void)setWhitePointEnd:(id *)a3
{
  objc_copyStruct(&self->_whitePointEnd, a3, 36, 1, 0);
}

- (float)scaleStart
{
  return self->_scaleStart;
}

- (void)setScaleStart:(float)a3
{
  self->_scaleStart = a3;
}

- (float)scaleEnd
{
  return self->_scaleEnd;
}

- (void)setScaleEnd:(float)a3
{
  self->_scaleEnd = a3;
}

void __35__CAWhitePointRamper_rampCallback___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  NSObject *v11;
  int v12;
  double v13;
  float v14;
  float v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = *(float *)(a1 + 40);
  v4 = *(float *)(a1 + 48);
  v14 = *(float *)(a1 + 52);
  v15 = *(float *)(a1 + 44);
  v6 = *(float *)(a1 + 56);
  v5 = *(float *)(a1 + 60);
  v8 = *(float *)(a1 + 64);
  v7 = *(float *)(a1 + 68);
  v9 = *(float *)(a1 + 72);
  v10 = CATimeWithHostTime(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("brightnessTransactionPresentationTime")), "unsignedLongLongValue"));
  if (x_log_hook_p())
  {
    objc_msgSend(*(id *)(a1 + 32), "id");
    x_log_();
  }
  else
  {
    v11 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "id");
      v13 = *(float *)(a1 + 76);
      *(_DWORD *)buf = 67111936;
      v17 = v12;
      v18 = 2048;
      v19 = v13;
      v20 = 2048;
      v21 = v3;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = v4;
      v26 = 2048;
      v27 = v14;
      v28 = 2048;
      v29 = v6;
      v30 = 2048;
      v31 = v5;
      v32 = 2048;
      v33 = v8;
      v34 = 2048;
      v35 = v7;
      v36 = 2048;
      v37 = v9;
      v38 = 2048;
      v39 = v10;
      _os_log_impl(&dword_184457000, v11, OS_LOG_TYPE_DEFAULT, "Whitepoint ramp %d\n\t scale %g\n [%g %g %g]\n\t[%g %g %g]\n\t[%g %g %g]\n\tHit glass at time %.3f\n", buf, 0x76u);
    }
  }
}

@end
