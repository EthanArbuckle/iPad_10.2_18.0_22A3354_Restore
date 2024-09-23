@implementation MPCPlayerSuggestLessCommandRequest

- (MPCPlayerSuggestLessCommandRequest)initWithModelObject:(id)a3 value:(BOOL)a4 controller:(id)a5 label:(id)a6
{
  id v11;
  id v12;
  void *v13;
  MPCPlayerSuggestLessCommandRequest *v14;

  v11 = a3;
  v12 = a6;
  objc_msgSend(a5, "resolvedPlayerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:playerPath:label:](self, "initWithMediaRemoteCommand:options:playerPath:label:", 0xFFFFFFFFLL, 0, v13, v12);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_modelObject, a3);
    v14->_value = a4;
  }

  return v14;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (BOOL)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end
