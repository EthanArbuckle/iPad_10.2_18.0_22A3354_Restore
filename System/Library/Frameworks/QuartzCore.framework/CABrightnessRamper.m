@implementation CABrightnessRamper

- (CABrightnessRamper)initWithDisplay:(id)a3
{
  CABrightnessRamper *v3;
  CABrightnessRamper *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CABrightnessRamper;
  v3 = -[CAWindowServerRamper initWithDisplay:](&v6, sel_initWithDisplay_, a3);
  v4 = v3;
  if (v3)
  {
    -[CABrightnessRamper setSdrNitsBegin:](v3, "setSdrNitsBegin:", NAN);
    -[CABrightnessRamper setSdrNitsEnd:](v4, "setSdrNitsEnd:", NAN);
    -[CABrightnessRamper setHeadroomBegin:](v4, "setHeadroomBegin:", NAN);
    -[CABrightnessRamper setHeadroomEnd:](v4, "setHeadroomEnd:", NAN);
    -[CABrightnessRamper setLimitBegin:](v4, "setLimitBegin:", NAN);
    -[CABrightnessRamper setLimitEnd:](v4, "setLimitEnd:", NAN);
    -[CABrightnessRamper setContrastEnhancerBegin:](v4, "setContrastEnhancerBegin:", NAN);
    -[CABrightnessRamper setContrastEnhancerEnd:](v4, "setContrastEnhancerEnd:", NAN);
    -[CABrightnessRamper setLowAmbientStrengthBegin:](v4, "setLowAmbientStrengthBegin:", NAN);
    -[CABrightnessRamper setLowAmbientStrengthEnd:](v4, "setLowAmbientStrengthEnd:", NAN);
    -[CABrightnessRamper setHighAmbientStrengthBegin:](v4, "setHighAmbientStrengthBegin:", NAN);
    -[CABrightnessRamper setHighAmbientStrengthEnd:](v4, "setHighAmbientStrengthEnd:", NAN);
    -[CABrightnessRamper setIndicatorNitsBegin:](v4, "setIndicatorNitsBegin:", NAN);
    -[CABrightnessRamper setIndicatorNitsEnd:](v4, "setIndicatorNitsEnd:", NAN);
  }
  return v4;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  NSObject *v54;
  CAWindowServerDisplay *v55;
  double v56;
  CAWindowServerDisplay *v57;
  double v58;
  CAWindowServerDisplay *v59;
  double v60;
  CAWindowServerDisplay *v61;
  double v62;
  CAWindowServerDisplay *v63;
  double v64;
  CAWindowServerDisplay *v65;
  double v66;
  CAWindowServerDisplay *v67;
  double v68;
  uint64_t v69;
  double v70;
  CAWindowServerDisplay *v71;
  NSObject *v72;
  int v73;
  uint64_t v74;
  __CFRunLoop *Current;
  NSObject *v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  _QWORD v95[10];
  id v96;
  uint8_t buf[4];
  int v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  -[CABrightnessRamper sdrNitsBegin](self, "sdrNitsBegin");
  v6 = v5;
  -[CABrightnessRamper sdrNitsEnd](self, "sdrNitsEnd");
  v8 = v7;
  -[CABrightnessRamper headroomBegin](self, "headroomBegin");
  v94 = v9;
  -[CABrightnessRamper headroomEnd](self, "headroomEnd");
  v91 = v10;
  -[CABrightnessRamper limitBegin](self, "limitBegin");
  v93 = v11;
  -[CABrightnessRamper limitEnd](self, "limitEnd");
  v90 = v12;
  -[CABrightnessRamper contrastEnhancerBegin](self, "contrastEnhancerBegin");
  v92 = v13;
  -[CABrightnessRamper contrastEnhancerEnd](self, "contrastEnhancerEnd");
  v89 = v14;
  -[CABrightnessRamper lowAmbientStrengthBegin](self, "lowAmbientStrengthBegin");
  v16 = v15;
  -[CABrightnessRamper lowAmbientStrengthEnd](self, "lowAmbientStrengthEnd");
  v88 = v17;
  -[CABrightnessRamper highAmbientStrengthBegin](self, "highAmbientStrengthBegin");
  v19 = v18;
  -[CABrightnessRamper highAmbientStrengthEnd](self, "highAmbientStrengthEnd");
  v87 = v20;
  -[CABrightnessRamper indicatorNitsBegin](self, "indicatorNitsBegin");
  v22 = v21;
  -[CABrightnessRamper indicatorNitsEnd](self, "indicatorNitsEnd");
  v86 = v23;
  -[CAWindowServerRamper beginTime](self, "beginTime");
  if (v24 <= 0.0)
  {
    objc_msgSend(a3, "targetTimestamp");
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  v96 = 0;
  objc_msgSend(a3, "targetTimestamp");
  v26 = v25;
  -[CAWindowServerRamper beginTime](self, "beginTime");
  v28 = v26 - v27;
  -[CAWindowServerRamper duration](self, "duration");
  if (v28 / v29 > 1.0
    || (objc_msgSend(a3, "targetTimestamp"),
        v31 = v30,
        -[CAWindowServerRamper beginTime](self, "beginTime"),
        v33 = v31 - v32,
        -[CAWindowServerRamper duration](self, "duration"),
        v35 = v33 / v34,
        v36 = 0.0,
        v35 >= 0.0))
  {
    objc_msgSend(a3, "targetTimestamp");
    v38 = v37;
    -[CAWindowServerRamper beginTime](self, "beginTime");
    v40 = v38 - v39;
    -[CAWindowServerRamper duration](self, "duration");
    v42 = v40 / v41;
    v36 = 1.0;
    if (v42 <= 1.0)
    {
      objc_msgSend(a3, "targetTimestamp");
      v44 = v43;
      -[CAWindowServerRamper beginTime](self, "beginTime");
      v46 = v44 - v45;
      -[CAWindowServerRamper duration](self, "duration");
      v36 = v46 / v47;
    }
  }
  v48 = pow(v6 / v8, 2.22044605e-16 - v36) * v6;
  v49 = pow(v94 / v91, 2.22044605e-16 - v36) * v94;
  v50 = pow(v93 / v90, 2.22044605e-16 - v36) * v93;
  v51 = v16 + v36 * (v88 - v16);
  v52 = v19 + v36 * (v87 - v19);
  v53 = v22 + v36 * (v86 - v22);
  if (x_log_hook_p())
  {
    v84 = v52;
    v85 = v53;
    v82 = v92 + v36 * (v89 - v92);
    v83 = v51;
    v80 = v49;
    v81 = v50;
    v79 = *(_QWORD *)&v48;
    v78 = -[CAWindowServerRamper id](self, "id");
    x_log_();
  }
  else
  {
    v54 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110912;
      v98 = -[CAWindowServerRamper id](self, "id");
      v99 = 2048;
      v100 = v48;
      v101 = 2048;
      v102 = v49;
      v103 = 2048;
      v104 = v50;
      v105 = 2048;
      v106 = v92 + v36 * (v89 - v92);
      v107 = 2048;
      v108 = v51;
      v109 = 2048;
      v110 = v52;
      v111 = 2048;
      v112 = v53;
      _os_log_impl(&dword_184457000, v54, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting SDR brightness to %g nits, headroom to %g, limit to %g, contrast enhancer to %g, low_amb_str to %g, high_amb_str to %g indicator_nits to %g", buf, 0x4Eu);
    }
  }
  if ((*(_QWORD *)&v48 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v55 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v56 = v48;
    -[CAWindowServerDisplay setSDRBrightness:](v55, "setSDRBrightness:", v56);
  }
  if ((*(_QWORD *)&v49 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v57 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v58 = v49;
    -[CAWindowServerDisplay setHeadroom:](v57, "setHeadroom:", v58);
  }
  if ((*(_QWORD *)&v50 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v59 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v60 = v50;
    -[CAWindowServerDisplay setBrightnessLimit:](v59, "setBrightnessLimit:", v60);
  }
  if (COERCE_UNSIGNED_INT64(fabs(v92 + v36 * (v89 - v92))) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v61 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v62 = v92 + v36 * (v89 - v92);
    -[CAWindowServerDisplay setContrastEnhancer:](v61, "setContrastEnhancer:", v62);
  }
  if ((*(_QWORD *)&v51 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v63 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v64 = v51;
    -[CAWindowServerDisplay setLowAmbientAdaptation:](v63, "setLowAmbientAdaptation:", v64);
  }
  if ((*(_QWORD *)&v52 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v65 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v66 = v52;
    -[CAWindowServerDisplay setHighAmbientAdaptation:](v65, "setHighAmbientAdaptation:", v66);
  }
  if ((*(_QWORD *)&v53 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v67 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v68 = v53;
    -[CAWindowServerDisplay setIndicatorBrightness:](v67, "setIndicatorBrightness:", v68);
  }
  v69 = mach_absolute_time();
  v70 = CATimeWithHostTime(v69);
  v71 = -[CAWindowServerRamper display](self, "display");
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __35__CABrightnessRamper_rampCallback___block_invoke;
  v95[3] = &unk_1E159DB30;
  v95[4] = self;
  *(double *)&v95[5] = v48;
  *(double *)&v95[6] = v49;
  *(double *)&v95[7] = v50;
  *(double *)&v95[8] = v92 + v36 * (v89 - v92);
  *(double *)&v95[9] = v70;
  if (!-[CAWindowServerDisplay commitBrightness:withBlock:](v71, "commitBrightness:withBlock:", &v96, v95))
  {
    if (x_log_hook_p())
    {
      v78 = -[CAWindowServerRamper id](self, "id");
      v79 = objc_msgSend((id)objc_msgSend(v96, "localizedDescription"), "UTF8String");
      x_log_();
    }
    else
    {
      v72 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        v73 = -[CAWindowServerRamper id](self, "id");
        v74 = objc_msgSend((id)objc_msgSend(v96, "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 67109378;
        v98 = v73;
        v99 = 2080;
        v100 = *(double *)&v74;
        _os_log_impl(&dword_184457000, v72, OS_LOG_TYPE_ERROR, "Ramp %d: Error setting brightness: %s", buf, 0x12u);
      }
    }
    -[CADisplayLink invalidate](-[CAWindowServerRamper link](self, "link", v78, v79, *(_QWORD *)&v80, *(_QWORD *)&v81, *(_QWORD *)&v82, *(_QWORD *)&v83, *(_QWORD *)&v84, *(_QWORD *)&v85), "invalidate");
  }
  if (v36 == 1.0)
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
      v76 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        v77 = -[CAWindowServerRamper id](self, "id");
        *(_DWORD *)buf = 67109120;
        v98 = v77;
        _os_log_impl(&dword_184457000, v76, OS_LOG_TYPE_DEFAULT, "Ramp %d: Complete", buf, 8u);
      }
    }
  }
}

- (double)sdrNitsBegin
{
  return self->_sdrNitsBegin;
}

- (void)setSdrNitsBegin:(double)a3
{
  self->_sdrNitsBegin = a3;
}

- (double)sdrNitsEnd
{
  return self->_sdrNitsEnd;
}

- (void)setSdrNitsEnd:(double)a3
{
  self->_sdrNitsEnd = a3;
}

- (double)headroomBegin
{
  return self->_headroomBegin;
}

- (void)setHeadroomBegin:(double)a3
{
  self->_headroomBegin = a3;
}

- (double)headroomEnd
{
  return self->_headroomEnd;
}

- (void)setHeadroomEnd:(double)a3
{
  self->_headroomEnd = a3;
}

- (double)limitBegin
{
  return self->_limitBegin;
}

- (void)setLimitBegin:(double)a3
{
  self->_limitBegin = a3;
}

- (double)limitEnd
{
  return self->_limitEnd;
}

- (void)setLimitEnd:(double)a3
{
  self->_limitEnd = a3;
}

- (double)contrastEnhancerBegin
{
  return self->_contrastEnhancerBegin;
}

- (void)setContrastEnhancerBegin:(double)a3
{
  self->_contrastEnhancerBegin = a3;
}

- (double)contrastEnhancerEnd
{
  return self->_contrastEnhancerEnd;
}

- (void)setContrastEnhancerEnd:(double)a3
{
  self->_contrastEnhancerEnd = a3;
}

- (double)lowAmbientStrengthBegin
{
  return self->_lowAmbientStrengthBegin;
}

- (void)setLowAmbientStrengthBegin:(double)a3
{
  self->_lowAmbientStrengthBegin = a3;
}

- (double)lowAmbientStrengthEnd
{
  return self->_lowAmbientStrengthEnd;
}

- (void)setLowAmbientStrengthEnd:(double)a3
{
  self->_lowAmbientStrengthEnd = a3;
}

- (double)highAmbientStrengthBegin
{
  return self->_highAmbientStrengthBegin;
}

- (void)setHighAmbientStrengthBegin:(double)a3
{
  self->_highAmbientStrengthBegin = a3;
}

- (double)highAmbientStrengthEnd
{
  return self->_highAmbientStrengthEnd;
}

- (void)setHighAmbientStrengthEnd:(double)a3
{
  self->_highAmbientStrengthEnd = a3;
}

- (double)indicatorNitsBegin
{
  return self->_indicatorNitsBegin;
}

- (void)setIndicatorNitsBegin:(double)a3
{
  self->_indicatorNitsBegin = a3;
}

- (double)indicatorNitsEnd
{
  return self->_indicatorNitsEnd;
}

- (void)setIndicatorNitsEnd:(double)a3
{
  self->_indicatorNitsEnd = a3;
}

void __35__CABrightnessRamper_rampCallback___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = CATimeWithHostTime(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("brightnessTransactionPresentationTime")), "unsignedLongLongValue"));
  if (x_log_hook_p())
  {
    objc_msgSend(*(id *)(a1 + 32), "id");
    x_log_();
  }
  else
  {
    v4 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "id");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 64);
      v10 = (v3 - *(double *)(a1 + 72)) * 1000.0;
      *(_DWORD *)buf = 67110656;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v3;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_184457000, v4, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting SDR brightness to %g nits, headroom to %g, limit to %g, contrast enhancer to %g [Hit the glass at time %.3f, took %.3f msec]", buf, 0x44u);
    }
  }
}

@end
