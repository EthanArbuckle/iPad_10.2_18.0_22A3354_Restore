@implementation AVCMediaRecorderConfiguration

+ (id)newClientDictionary:(id)a3 clientPid:(int)a4
{
  uint64_t v4;
  VCMediaRecorderConfiguration *v6;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(VCMediaRecorderConfiguration);
  -[VCMediaRecorderConfiguration setMediaAvailability:](v6, "setMediaAvailability:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaAvailability")), "unsignedIntValue"));
  -[VCMediaRecorderConfiguration setClientPid:](v6, "setClientPid:", v4);
  return v6;
}

- (id)dictionary
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("vcMomentsMediaAvailability");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediaAvailability);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaAvailability=%u"), self->_mediaAvailability);
}

- (unsigned)mediaAvailability
{
  return self->_mediaAvailability;
}

- (void)setMediaAvailability:(unsigned int)a3
{
  self->_mediaAvailability = a3;
}

@end
