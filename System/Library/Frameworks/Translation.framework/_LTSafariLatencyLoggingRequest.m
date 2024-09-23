@implementation _LTSafariLatencyLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  double start;
  id v5;

  start = self->_start;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("start"), start);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("firstResponse"), self->_firstResponse);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("firstParagraphComplete"), self->_firstParagraphComplete);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("progressComplete"), self->_progressComplete);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("pageComplete"), self->_pageComplete);
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));

}

- (_LTSafariLatencyLoggingRequest)initWithCoder:(id)a3
{
  id v4;
  _LTSafariLatencyLoggingRequest *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _LTLocalePair *localePair;
  _LTSafariLatencyLoggingRequest *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTSafariLatencyLoggingRequest;
  v5 = -[_LTSafariLatencyLoggingRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start"));
    v5->_start = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstResponse"));
    v5->_firstResponse = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstParagraphComplete"));
    v5->_firstParagraphComplete = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progressComplete"));
    v5->_progressComplete = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pageComplete"));
    v5->_pageComplete = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v11 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v11;

    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTSafariLatencyLoggingRequest)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_LTSafariLatencyLoggingRequest;
  v2 = -[_LTSafariLatencyLoggingRequest init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    *((_QWORD *)v2 + 2) = v4;

    *((_QWORD *)v2 + 6) = 0xBFF0000000000000;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 24) = _Q0;
    v10 = v2;
  }

  return (_LTSafariLatencyLoggingRequest *)v2;
}

- (void)markResponse
{
  double v3;
  id v4;

  if (self->_firstResponse < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    self->_firstResponse = v3;

  }
}

- (void)markFirstParagraphComplete
{
  double v3;
  id v4;

  if (self->_firstParagraphComplete < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    self->_firstParagraphComplete = v3;

  }
}

- (void)markProgressDone
{
  double v3;
  id v4;

  if (self->_progressComplete < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    self->_progressComplete = v3;

  }
}

- (void)markPageComplete
{
  double v3;
  id v4;

  if (self->_pageComplete < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    self->_pageComplete = v3;

  }
}

- (NSDictionary)dict
{
  double start;
  void *v4;
  NSString *processName;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  if (self->_firstResponse < 0.0)
    self->_firstResponse = self->_start;
  start = self->_start;
  if (self->_firstParagraphComplete < 0.0)
    self->_firstParagraphComplete = start;
  if (self->_progressComplete < start)
    self->_progressComplete = start;
  v12[0] = CFSTR("localePair");
  -[_LTLocalePair combinedLocaleIdentifier](self->_localePair, "combinedLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  processName = self->_processName;
  v13[0] = v4;
  v13[1] = processName;
  v12[1] = CFSTR("processName");
  v12[2] = CFSTR("timeToFirstResponse");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_firstResponse - self->_start);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("timeToFirstParagraphComplete");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_firstParagraphComplete - self->_start);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("timeToProgressComplete");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressComplete - self->_start);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("timeToPageComplete");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pageComplete - self->_start);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)start
{
  return self->_start;
}

- (double)firstResponse
{
  return self->_firstResponse;
}

- (double)firstParagraphComplete
{
  return self->_firstParagraphComplete;
}

- (double)progressComplete
{
  return self->_progressComplete;
}

- (double)pageComplete
{
  return self->_pageComplete;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

@end
