@implementation AVTAvatarPhysicsState

- (AVTAvatarPhysicsState)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AVTAvatarPhysicsState *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarPhysicsState;
  v5 = -[AVTAvatarPhysicsState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
