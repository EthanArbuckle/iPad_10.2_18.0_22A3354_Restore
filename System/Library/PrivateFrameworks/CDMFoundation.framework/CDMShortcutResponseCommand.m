@implementation CDMShortcutResponseCommand

- (CDMShortcutResponseCommand)initWithVoiceCommandUserParses:(id)a3 autoShortcutParses:(id)a4
{
  id v7;
  id v8;
  CDMShortcutResponseCommand *v9;
  CDMShortcutResponseCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMShortcutResponseCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceCommandsUserParses, a3);
    objc_storeStrong((id *)&v10->_autoShortcutParses, a4);
  }

  return v10;
}

- (NSArray)voiceCommandsUserParses
{
  return self->_voiceCommandsUserParses;
}

- (NSArray)autoShortcutParses
{
  return self->_autoShortcutParses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoShortcutParses, 0);
  objc_storeStrong((id *)&self->_voiceCommandsUserParses, 0);
}

@end
