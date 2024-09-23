@implementation BLHLSStreamInf

- (void)setPropertiesFromAttributeList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *codecs;
  NSString *v9;
  NSString *audio;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BANDWIDTH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bandwidth = sub_212C8ACB4(v4);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVERAGE-BANDWIDTH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    self->_averageBandwidth = sub_212C8ACB4(v5);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CODECS"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  codecs = self->_codecs;
  self->_codecs = v7;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AUDIO"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  audio = self->_audio;
  self->_audio = v9;

}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[BLHLSStreamInf bandwidth](self, "bandwidth");
  v5 = -[BLHLSStreamInf averageBandwidth](self, "averageBandwidth");
  -[BLHLSStreamInf codecs](self, "codecs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSStreamInf audio](self, "audio");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ Bandwidth: %llu, Average Bandwidth: %llu, codecs: %@, audio: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)averageBandwidthFallbackToPeak
{
  unint64_t result;

  result = self->_averageBandwidth;
  if (!result)
    return self->_bandwidth;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (unint64_t)bandwidth
{
  return self->_bandwidth;
}

- (unint64_t)averageBandwidth
{
  return self->_averageBandwidth;
}

- (NSString)codecs
{
  return self->_codecs;
}

- (NSString)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_codecs, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
