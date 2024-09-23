@implementation VCMediaNegotiatorResultsAudio

- (VCMediaNegotiatorResultsAudio)init
{
  char *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResultsAudio;
  v2 = -[VCMediaNegotiatorResultsAudio init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 4) = objc_opt_new();
    *(_QWORD *)(v2 + 20) = 0x8000000080;
    *((_DWORD *)v2 + 7) = 128;
    *((_QWORD *)v2 + 6) = 3;
  }
  return (VCMediaNegotiatorResultsAudio *)v2;
}

- (NSArray)secondaryPayloads
{
  return (NSArray *)-[NSMutableSet allObjects](self->_secondaryPayloads, "allObjects");
}

- (void)addSecondaryPayload:(int)a3
{
  -[NSMutableSet addObject:](self->_secondaryPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsAudio;
  -[VCMediaNegotiatorResultsAudio dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(a3, "remoteSSRC") == self->_remoteSSRC
    && objc_msgSend(a3, "audioUnitModel") == self->_audioUnitModel
    && self->_allowRecording == objc_msgSend(a3, "allowRecording")
    && self->_allowSwitching == objc_msgSend(a3, "allowSwitching")
    && objc_msgSend(a3, "primaryPayload") == self->_primaryPayload
    && objc_msgSend(a3, "dtxPayload") == self->_dtxPayload
    && objc_msgSend(a3, "redPayload") == self->_redPayload
    && self->_useSBR == objc_msgSend(a3, "useSBR")
    && objc_msgSend(a3, "cipherSuite") == self->_cipherSuite)
  {
    return -[NSMutableSet isEqualToSet:](self->_secondaryPayloads, "isEqualToSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "secondaryPayloads")));
  }
  else
  {
    return 0;
  }
}

- (int)primaryPayload
{
  return self->_primaryPayload;
}

- (void)setPrimaryPayload:(int)a3
{
  self->_primaryPayload = a3;
}

- (int)dtxPayload
{
  return self->_dtxPayload;
}

- (void)setDtxPayload:(int)a3
{
  self->_dtxPayload = a3;
}

- (int)redPayload
{
  return self->_redPayload;
}

- (void)setRedPayload:(int)a3
{
  self->_redPayload = a3;
}

- (BOOL)allowRecording
{
  return self->_allowRecording;
}

- (void)setAllowRecording:(BOOL)a3
{
  self->_allowRecording = a3;
}

- (unsigned)audioUnitModel
{
  return self->_audioUnitModel;
}

- (void)setAudioUnitModel:(unsigned int)a3
{
  self->_audioUnitModel = a3;
}

- (BOOL)allowSwitching
{
  return self->_allowSwitching;
}

- (void)setAllowSwitching:(BOOL)a3
{
  self->_allowSwitching = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_useSBR = a3;
}

- (int64_t)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(int64_t)a3
{
  self->_cipherSuite = a3;
}

@end
