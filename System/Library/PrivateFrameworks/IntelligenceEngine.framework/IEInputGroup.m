@implementation IEInputGroup

- (IEInputGroup)initWithId:(id)a3
{
  id v5;
  IEInputGroup *v6;
  IEInputGroup *v7;
  NSString *dialogPhase;
  NSDictionary *nlParameters;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IEInputGroup;
  v6 = -[IEInputGroup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputGroupId, a3);
    *(_WORD *)&v7->_listenAfterSpeaking = 257;
    dialogPhase = v7->_dialogPhase;
    v7->_dialogPhase = (NSString *)&stru_24F544478;

    nlParameters = v7->_nlParameters;
    v7->_nlParameters = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v7;
}

- (NSString)inputGroupId
{
  return self->_inputGroupId;
}

- (void)setInputGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_inputGroupId, a3);
}

- (BOOL)listenAfterSpeaking
{
  return self->_listenAfterSpeaking;
}

- (void)setListenAfterSpeaking:(BOOL)a3
{
  self->_listenAfterSpeaking = a3;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
}

- (NSDictionary)nlParameters
{
  return self->_nlParameters;
}

- (void)setNlParameters:(id)a3
{
  objc_storeStrong((id *)&self->_nlParameters, a3);
}

- (BOOL)immersiveExperience
{
  return self->_immersiveExperience;
}

- (void)setImmersiveExperience:(BOOL)a3
{
  self->_immersiveExperience = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlParameters, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_inputGroupId, 0);
}

@end
