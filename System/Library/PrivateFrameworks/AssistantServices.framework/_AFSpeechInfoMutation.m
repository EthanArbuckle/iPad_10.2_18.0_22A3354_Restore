@implementation _AFSpeechInfoMutation

- (_AFSpeechInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechInfoMutation *v6;
  _AFSpeechInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechInfoMutation;
  v6 = -[_AFSpeechInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getSpeechRecognizedCommand
{
  SASSpeechRecognized *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_speechRecognizedCommand;
  }
  else
  {
    -[AFSpeechInfo speechRecognizedCommand](self->_base, "speechRecognizedCommand");
    v2 = (SASSpeechRecognized *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeechRecognizedCommand:(id)a3
{
  objc_storeStrong((id *)&self->_speechRecognizedCommand, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRecognizedCommand, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
