@implementation _AFSiriClientState

- (_AFSiriClientState)init
{
  _AFSiriClientState *v2;
  NSMutableSet *v3;
  NSMutableSet *requestUUIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_AFSiriClientState;
  v2 = -[_AFSiriClientState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requestUUIDs = v2->_requestUUIDs;
    v2->_requestUUIDs = v3;

  }
  return v2;
}

- (void)addRequestUUID:(id)a3
{
  -[NSMutableSet addObject:](self->_requestUUIDs, "addObject:", a3);
}

- (void)removeRequestUUID:(id)a3
{
  -[NSMutableSet removeObject:](self->_requestUUIDs, "removeObject:", a3);
}

- (unint64_t)notifyState
{
  _BOOL8 hasActiveSession;
  unint64_t v4;

  hasActiveSession = self->_hasActiveSession;
  v4 = (-[NSMutableSet count](self->_requestUUIDs, "count") != 0) | (unint64_t)(2 * hasActiveSession);
  if (self->_isListening)
    v4 |= 4uLL;
  if (self->_isSpeaking)
    return v4 | 8;
  else
    return v4;
}

- (BOOL)hasActiveSession
{
  return self->_hasActiveSession;
}

- (void)setHasActiveSession:(BOOL)a3
{
  self->_hasActiveSession = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_isSpeaking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
}

@end
