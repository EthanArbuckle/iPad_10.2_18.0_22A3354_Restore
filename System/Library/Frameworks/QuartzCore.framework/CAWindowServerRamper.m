@implementation CAWindowServerRamper

- (CAWindowServerRamper)initWithDisplay:(id)a3
{
  CAWindowServerRamper *v4;
  CAWindowServerRamper *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  unint64_t v13;
  objc_super v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CAWindowServerRamper;
  v4 = -[CAWindowServerRamper init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CAWindowServerRamper setDisplay:](v4, "setDisplay:", a3);
    v6 = +[CADisplay displays](CADisplay, "displays");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "displayId");
          if (v12 == objc_msgSend(a3, "displayId"))
          {
            -[CAWindowServerRamper setCadisplay:](v5, "setCadisplay:", v11);
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
    do
LABEL_12:
      v13 = __ldaxr((unint64_t *)&_id_generator);
    while (__stlxr(v13 + 1, (unint64_t *)&_id_generator));
    v5->_id = v13;
    v5->_beginTime = -1.0;
  }
  return v5;
}

- (void)rampCallback:(id)a3
{
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v3 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_184457000, v3, OS_LOG_TYPE_DEFAULT, "rampCallback unimplemented", v4, 2u);
    }
  }
}

- (void)runRamp
{
  CADisplayLink *v3;
  uint64_t v4;

  -[CAWindowServerRamper setLink:](self, "setLink:", +[CADisplayLink displayLinkWithDisplay:target:selector:](CADisplayLink, "displayLinkWithDisplay:target:selector:", -[CAWindowServerRamper cadisplay](self, "cadisplay"), self, sel_rampCallback_));
  v3 = -[CAWindowServerRamper link](self, "link");
  v4 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  -[CADisplayLink addToRunLoop:forMode:](v3, "addToRunLoop:forMode:", v4, *MEMORY[0x1E0C99748]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "run");
}

- (CAWindowServerDisplay)display
{
  return (CAWindowServerDisplay *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CADisplay)cadisplay
{
  return (CADisplay *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCadisplay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CADisplayLink)link
{
  return (CADisplayLink *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int)id
{
  return self->_id;
}

- (void)setId:(int)a3
{
  self->_id = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

@end
