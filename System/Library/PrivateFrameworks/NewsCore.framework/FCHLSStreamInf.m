@implementation FCHLSStreamInf

- (void)setPropertiesFromAttributeList:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v11 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BANDWIDTH"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    a1[2] = FCHLSUIntegerFromString(v4);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVERAGE-BANDWIDTH"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      a1[3] = FCHLSUIntegerFromString(v5);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CODECS"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)a1[4];
    a1[4] = v7;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AUDIO"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)a1[5];
    a1[5] = v9;

    v3 = v11;
  }

}

- (id)description
{
  void *v2;
  unint64_t bandwidth;
  unint64_t averageBandwidth;
  NSString *v6;
  NSString *audio;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    bandwidth = self->_bandwidth;
    averageBandwidth = self->_averageBandwidth;
    v6 = self->_codecs;
    audio = self->_audio;
  }
  else
  {
    v6 = 0;
    bandwidth = 0;
    averageBandwidth = 0;
    audio = 0;
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{ Bandwidth: %llu, Average Bandwidth: %llu, codecs: %@, audio: %@"), bandwidth, averageBandwidth, v6, audio);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_codecs, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
