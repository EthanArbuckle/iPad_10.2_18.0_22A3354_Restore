@implementation CUVoiceRequest

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong(&self->_owner, a3);
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
