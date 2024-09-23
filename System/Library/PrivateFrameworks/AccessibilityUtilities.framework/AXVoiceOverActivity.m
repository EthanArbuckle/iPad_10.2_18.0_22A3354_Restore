@implementation AXVoiceOverActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXVoiceOverActivity)init
{
  AXVoiceOverActivity *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXVoiceOverActivity;
  v2 = -[AXVoiceOverActivity init](&v5, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setUuid:](v2, "setUuid:", v3);

  return v2;
}

- (NSString)voiceIdentifier
{
  void *v2;
  void *v3;

  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setVoiceIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CF3968]);
    -[AXVoiceOverActivity speechRate](self, "speechRate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXVoiceOverActivity volume](self, "volume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithVoiceId:rate:pitch:volume:voiceSettings:effects:", v10, v6, 0, v7, 0, 0);
    -[AXVoiceOverActivity setVoiceSelection:](self, "setVoiceSelection:", v8);

  }
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVoiceId:", v10);

}

- (NSNumber)speechRate
{
  void *v2;
  void *v3;

  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setSpeechRate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CF3968]);
    -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXVoiceOverActivity volume](self, "volume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithVoiceId:rate:pitch:volume:voiceSettings:effects:", v6, v10, 0, v7, 0, 0);
    -[AXVoiceOverActivity setVoiceSelection:](self, "setVoiceSelection:", v8);

  }
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRate:", v10);

}

- (NSNumber)volume
{
  void *v2;
  void *v3;

  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setVolume:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CF3968]);
    -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXVoiceOverActivity speechRate](self, "speechRate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithVoiceId:rate:pitch:volume:voiceSettings:effects:", v6, v7, 0, v10, 0, 0);
    -[AXVoiceOverActivity setVoiceSelection:](self, "setVoiceSelection:", v8);

  }
  -[AXVoiceOverActivity voiceSelection](self, "voiceSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVolume:", v10);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXVoiceOverActivity builtIn](self, "builtIn"), CFSTR("builtIn"));
  -[AXVoiceOverActivity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[AXVoiceOverActivity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[AXVoiceOverActivity textualContexts](self, "textualContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("textualContext"));

  -[AXVoiceOverActivity appIdentifiers](self, "appIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appIdentifier"));

  -[AXVoiceOverActivity punctuationGroup](self, "punctuationGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("punctuationGroup"));

  -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("voiceIdentifier"));

  -[AXVoiceOverActivity speechRate](self, "speechRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("speechRate"));

  -[AXVoiceOverActivity volume](self, "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("volume"));

  -[AXVoiceOverActivity soundMuted](self, "soundMuted");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("soundMuted"));

  -[AXVoiceOverActivity speechMuted](self, "speechMuted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("speechMuted"));

  -[AXVoiceOverActivity audioDucking](self, "audioDucking");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("audioDucking"));

  -[AXVoiceOverActivity modifierKeys](self, "modifierKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("modifierKeys"));

  -[AXVoiceOverActivity brailleTable](self, "brailleTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("brailleTable"));

  -[AXVoiceOverActivity brailleInputTable](self, "brailleInputTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("brailleInputTable"));

  -[AXVoiceOverActivity brailleStatusCellGeneral](self, "brailleStatusCellGeneral");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("brailleStatusCellGeneral"));

  -[AXVoiceOverActivity brailleStatusCellText](self, "brailleStatusCellText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("brailleStatusCellText"));

  -[AXVoiceOverActivity tableHeaders](self, "tableHeaders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("tableHeaders"));

  -[AXVoiceOverActivity tableRowAndColumn](self, "tableRowAndColumn");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("tableRowAndColumn"));

  -[AXVoiceOverActivity speakEmojis](self, "speakEmojis");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("speakEmojis"));

  -[AXVoiceOverActivity imageDescriptions](self, "imageDescriptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("imageDescriptions"));

  -[AXVoiceOverActivity containerFeedback](self, "containerFeedback");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("containerFeedback"));

  -[AXVoiceOverActivity numberFeedback](self, "numberFeedback");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("numberFeedback"));

  -[AXVoiceOverActivity brailleOutput](self, "brailleOutput");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("brailleOutput"));

  -[AXVoiceOverActivity brailleInput](self, "brailleInput");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("brailleInput"));

  -[AXVoiceOverActivity brailleAutoAdvanceDuration](self, "brailleAutoAdvanceDuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("brailleAutoAdvanceDuration"));

  -[AXVoiceOverActivity hints](self, "hints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("hints"));

  -[AXVoiceOverActivity typingStyle](self, "typingStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("typingStyle"));

  -[AXVoiceOverActivity navigationStyle](self, "navigationStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("navigationStyle"));

  -[AXVoiceOverActivity brailleAlerts](self, "brailleAlerts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("brailleAlerts"));

  -[AXVoiceOverActivity brailleFormatting](self, "brailleFormatting");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("brailleFormatting"));

}

- (AXVoiceOverActivity)initWithCoder:(id)a3
{
  id v4;
  AXVoiceOverActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v4 = a3;
  v5 = (AXVoiceOverActivity *)objc_opt_new();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setUuid:](v5, "setUuid:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setName:](v5, "setName:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("textualContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setTextualContexts:](v5, "setTextualContexts:", v11);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("appIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setAppIdentifiers:](v5, "setAppIdentifiers:", v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("punctuationGroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setPunctuationGroup:](v5, "setPunctuationGroup:", v16);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setVoiceIdentifier:](v5, "setVoiceIdentifier:", v17);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechRate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setSpeechRate:](v5, "setSpeechRate:", v18);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setVolume:](v5, "setVolume:", v19);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("soundMuted"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setSoundMuted:](v5, "setSoundMuted:", v20);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechMuted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setSpeechMuted:](v5, "setSpeechMuted:", v21);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioDucking"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setAudioDucking:](v5, "setAudioDucking:", v22);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifierKeys"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setModifierKeys:](v5, "setModifierKeys:", v23);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleStatusCellGeneral"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleStatusCellGeneral:](v5, "setBrailleStatusCellGeneral:", v24);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleStatusCellText"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleStatusCellText:](v5, "setBrailleStatusCellText:", v25);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleTable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleTable:](v5, "setBrailleTable:", v26);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleInputTable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleInputTable:](v5, "setBrailleInputTable:", v27);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakEmojis"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setSpeakEmojis:](v5, "setSpeakEmojis:", v28);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDescriptions"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setImageDescriptions:](v5, "setImageDescriptions:", v29);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerFeedback"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setContainerFeedback:](v5, "setContainerFeedback:", v30);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberFeedback"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setNumberFeedback:](v5, "setNumberFeedback:", v31);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableRowAndColumn"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setTableRowAndColumn:](v5, "setTableRowAndColumn:", v32);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableHeaders"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setTableHeaders:](v5, "setTableHeaders:", v33);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleOutput"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleOutput:](v5, "setBrailleOutput:", v34);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleInput"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleInput:](v5, "setBrailleInput:", v35);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleAutoAdvanceDuration"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleAutoAdvanceDuration:](v5, "setBrailleAutoAdvanceDuration:", v36);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hints"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setHints:](v5, "setHints:", v37);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typingStyle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setTypingStyle:](v5, "setTypingStyle:", v38);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("navigationStyle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setNavigationStyle:](v5, "setNavigationStyle:", v39);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleAlerts"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleAlerts:](v5, "setBrailleAlerts:", v40);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brailleFormatting"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity setBrailleFormatting:](v5, "setBrailleFormatting:", v41);

  v42 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("builtIn"));
  -[AXVoiceOverActivity setBuiltIn:](v5, "setBuiltIn:", v42);

  return v5;
}

+ (id)observerKeys
{
  return &unk_1E24F8D38;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = (void *)objc_opt_new();
  -[AXVoiceOverActivity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  -[AXVoiceOverActivity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  -[AXVoiceOverActivity textualContexts](self, "textualContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextualContexts:", v7);

  -[AXVoiceOverActivity appIdentifiers](self, "appIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppIdentifiers:", v8);

  -[AXVoiceOverActivity punctuationGroup](self, "punctuationGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPunctuationGroup:", v9);

  -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoiceIdentifier:", v10);

  -[AXVoiceOverActivity speechRate](self, "speechRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeechRate:", v11);

  -[AXVoiceOverActivity volume](self, "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVolume:", v12);

  -[AXVoiceOverActivity speechMuted](self, "speechMuted");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeechMuted:", v13);

  -[AXVoiceOverActivity audioDucking](self, "audioDucking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioDucking:", v14);

  -[AXVoiceOverActivity soundMuted](self, "soundMuted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSoundMuted:", v15);

  objc_msgSend(v4, "setBuiltIn:", -[AXVoiceOverActivity builtIn](self, "builtIn"));
  -[AXVoiceOverActivity modifierKeys](self, "modifierKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModifierKeys:", v16);

  -[AXVoiceOverActivity brailleStatusCellGeneral](self, "brailleStatusCellGeneral");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleStatusCellGeneral:", v17);

  -[AXVoiceOverActivity brailleStatusCellText](self, "brailleStatusCellText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleStatusCellText:", v18);

  -[AXVoiceOverActivity brailleTable](self, "brailleTable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleTable:", v19);

  -[AXVoiceOverActivity brailleInputTable](self, "brailleInputTable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleInputTable:", v20);

  -[AXVoiceOverActivity tableHeaders](self, "tableHeaders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableHeaders:", v21);

  -[AXVoiceOverActivity tableRowAndColumn](self, "tableRowAndColumn");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableRowAndColumn:", v22);

  -[AXVoiceOverActivity speakEmojis](self, "speakEmojis");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeakEmojis:", v23);

  -[AXVoiceOverActivity imageDescriptions](self, "imageDescriptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageDescriptions:", v24);

  -[AXVoiceOverActivity containerFeedback](self, "containerFeedback");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerFeedback:", v25);

  -[AXVoiceOverActivity numberFeedback](self, "numberFeedback");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberFeedback:", v26);

  -[AXVoiceOverActivity brailleInput](self, "brailleInput");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleInput:", v27);

  -[AXVoiceOverActivity brailleOutput](self, "brailleOutput");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleOutput:", v28);

  -[AXVoiceOverActivity brailleAutoAdvanceDuration](self, "brailleAutoAdvanceDuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleAutoAdvanceDuration:", v29);

  -[AXVoiceOverActivity hints](self, "hints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHints:", v30);

  -[AXVoiceOverActivity typingStyle](self, "typingStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypingStyle:", v31);

  -[AXVoiceOverActivity navigationStyle](self, "navigationStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationStyle:", v32);

  -[AXVoiceOverActivity brailleAlerts](self, "brailleAlerts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleAlerts:", v33);

  -[AXVoiceOverActivity brailleFormatting](self, "brailleFormatting");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrailleFormatting:", v34);

  return v4;
}

- (BOOL)identicalProperty:(id)a3 property2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (v5 || !v6) && (!v5 || v6) && (!v5 || !v6 || objc_msgSend(v5, "isEqual:", v6));

  return v8;
}

- (BOOL)isIdenticalTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  BOOL v88;

  v4 = a3;
  -[AXVoiceOverActivity speechRate](self, "speechRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v5, v6);

  if (!v7)
    goto LABEL_29;
  -[AXVoiceOverActivity volume](self, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v8, v9);

  if (!v10)
    goto LABEL_29;
  -[AXVoiceOverActivity speechMuted](self, "speechMuted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechMuted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v11, v12);

  if (!v13)
    goto LABEL_29;
  -[AXVoiceOverActivity soundMuted](self, "soundMuted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "soundMuted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v14, v15);

  if (!v16)
    goto LABEL_29;
  -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v17, v18);

  if (!v19)
    goto LABEL_29;
  -[AXVoiceOverActivity textualContexts](self, "textualContexts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textualContexts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v20, v21);

  if (!v22)
    goto LABEL_29;
  -[AXVoiceOverActivity name](self, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v23, v24);

  if (!v25)
    goto LABEL_29;
  -[AXVoiceOverActivity appIdentifiers](self, "appIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v26, v27);

  if (!v28)
    goto LABEL_29;
  -[AXVoiceOverActivity modifierKeys](self, "modifierKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifierKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v29, v30);

  if (!v31)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleStatusCellText](self, "brailleStatusCellText");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleStatusCellText");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v32, v33);

  if (!v34)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleStatusCellGeneral](self, "brailleStatusCellGeneral");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleStatusCellGeneral");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v35, v36);

  if (!v37)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleTable](self, "brailleTable");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleTable");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v38, v39);

  if (!v40)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleInputTable](self, "brailleInputTable");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleInputTable");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v41, v42);

  if (!v43)
    goto LABEL_29;
  -[AXVoiceOverActivity tableHeaders](self, "tableHeaders");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableHeaders");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v44, v45);

  if (!v46)
    goto LABEL_29;
  -[AXVoiceOverActivity tableRowAndColumn](self, "tableRowAndColumn");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableRowAndColumn");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v47, v48);

  if (!v49)
    goto LABEL_29;
  -[AXVoiceOverActivity speakEmojis](self, "speakEmojis");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakEmojis");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v50, v51);

  if (!v52)
    goto LABEL_29;
  -[AXVoiceOverActivity imageDescriptions](self, "imageDescriptions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDescriptions");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v53, v54);

  if (!v55)
    goto LABEL_29;
  -[AXVoiceOverActivity containerFeedback](self, "containerFeedback");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerFeedback");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v56, v57);

  if (!v58)
    goto LABEL_29;
  -[AXVoiceOverActivity numberFeedback](self, "numberFeedback");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberFeedback");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v59, v60);

  if (!v61)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleOutput](self, "brailleOutput");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleOutput");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v62, v63);

  if (!v64)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleInput](self, "brailleInput");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleInput");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v65, v66);

  if (!v67)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleAutoAdvanceDuration](self, "brailleAutoAdvanceDuration");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleAutoAdvanceDuration");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v68, v69);

  if (!v70)
    goto LABEL_29;
  -[AXVoiceOverActivity audioDucking](self, "audioDucking");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDucking");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v71, v72);

  if (!v73)
    goto LABEL_29;
  -[AXVoiceOverActivity hints](self, "hints");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hints");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v74, v75);

  if (!v76)
    goto LABEL_29;
  -[AXVoiceOverActivity typingStyle](self, "typingStyle");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typingStyle");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v77, v78);

  if (!v79)
    goto LABEL_29;
  -[AXVoiceOverActivity navigationStyle](self, "navigationStyle");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationStyle");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v80, v81);

  if (!v82)
    goto LABEL_29;
  -[AXVoiceOverActivity brailleAlerts](self, "brailleAlerts");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brailleAlerts");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v83, v84);

  if (v85)
  {
    -[AXVoiceOverActivity brailleFormatting](self, "brailleFormatting");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brailleFormatting");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = -[AXVoiceOverActivity identicalProperty:property2:](self, "identicalProperty:property2:", v86, v87);

  }
  else
  {
LABEL_29:
    v88 = 0;
  }

  return v88;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXVoiceOverActivity uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)AXVoiceOverActivity;
  -[AXVoiceOverActivity description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity appIdentifiers](self, "appIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity voiceIdentifier](self, "voiceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity punctuationGroup](self, "punctuationGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity volume](self, "volume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVoiceOverActivity speechRate](self, "speechRate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: name: %@, apps: %@, voice: %@, punctuation: %@, volume: %@, rate: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSSet)textualContexts
{
  return self->_textualContexts;
}

- (void)setTextualContexts:(id)a3
{
  objc_storeStrong((id *)&self->_textualContexts, a3);
}

- (NSSet)appIdentifiers
{
  return self->_appIdentifiers;
}

- (void)setAppIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifiers, a3);
}

- (NSUUID)punctuationGroup
{
  return self->_punctuationGroup;
}

- (void)setPunctuationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_punctuationGroup, a3);
}

- (NSNumber)tableHeaders
{
  return self->_tableHeaders;
}

- (void)setTableHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_tableHeaders, a3);
}

- (NSNumber)tableRowAndColumn
{
  return self->_tableRowAndColumn;
}

- (void)setTableRowAndColumn:(id)a3
{
  objc_storeStrong((id *)&self->_tableRowAndColumn, a3);
}

- (NSNumber)speakEmojis
{
  return self->_speakEmojis;
}

- (void)setSpeakEmojis:(id)a3
{
  objc_storeStrong((id *)&self->_speakEmojis, a3);
}

- (NSNumber)containerFeedback
{
  return self->_containerFeedback;
}

- (void)setContainerFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_containerFeedback, a3);
}

- (NSNumber)imageDescriptions
{
  return self->_imageDescriptions;
}

- (void)setImageDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_imageDescriptions, a3);
}

- (NSNumber)hints
{
  return self->_hints;
}

- (void)setHints:(id)a3
{
  objc_storeStrong((id *)&self->_hints, a3);
}

- (NSNumber)numberFeedback
{
  return self->_numberFeedback;
}

- (void)setNumberFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_numberFeedback, a3);
}

- (NSNumber)typingStyle
{
  return self->_typingStyle;
}

- (void)setTypingStyle:(id)a3
{
  objc_storeStrong((id *)&self->_typingStyle, a3);
}

- (NSNumber)navigationStyle
{
  return self->_navigationStyle;
}

- (void)setNavigationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStyle, a3);
}

- (NSNumber)speechMuted
{
  return self->_speechMuted;
}

- (void)setSpeechMuted:(id)a3
{
  objc_storeStrong((id *)&self->_speechMuted, a3);
}

- (NSNumber)soundMuted
{
  return self->_soundMuted;
}

- (void)setSoundMuted:(id)a3
{
  objc_storeStrong((id *)&self->_soundMuted, a3);
}

- (NSNumber)audioDucking
{
  return self->_audioDucking;
}

- (void)setAudioDucking:(id)a3
{
  objc_storeStrong((id *)&self->_audioDucking, a3);
}

- (NSNumber)modifierKeys
{
  return self->_modifierKeys;
}

- (void)setModifierKeys:(id)a3
{
  objc_storeStrong((id *)&self->_modifierKeys, a3);
}

- (NSNumber)brailleStatusCellGeneral
{
  return self->_brailleStatusCellGeneral;
}

- (void)setBrailleStatusCellGeneral:(id)a3
{
  objc_storeStrong((id *)&self->_brailleStatusCellGeneral, a3);
}

- (NSNumber)brailleStatusCellText
{
  return self->_brailleStatusCellText;
}

- (void)setBrailleStatusCellText:(id)a3
{
  objc_storeStrong((id *)&self->_brailleStatusCellText, a3);
}

- (NSString)brailleTable
{
  return self->_brailleTable;
}

- (void)setBrailleTable:(id)a3
{
  objc_storeStrong((id *)&self->_brailleTable, a3);
}

- (NSString)brailleInputTable
{
  return self->_brailleInputTable;
}

- (void)setBrailleInputTable:(id)a3
{
  objc_storeStrong((id *)&self->_brailleInputTable, a3);
}

- (NSNumber)brailleOutput
{
  return self->_brailleOutput;
}

- (void)setBrailleOutput:(id)a3
{
  objc_storeStrong((id *)&self->_brailleOutput, a3);
}

- (NSNumber)brailleInput
{
  return self->_brailleInput;
}

- (void)setBrailleInput:(id)a3
{
  objc_storeStrong((id *)&self->_brailleInput, a3);
}

- (NSNumber)brailleAutoAdvanceDuration
{
  return self->_brailleAutoAdvanceDuration;
}

- (void)setBrailleAutoAdvanceDuration:(id)a3
{
  objc_storeStrong((id *)&self->_brailleAutoAdvanceDuration, a3);
}

- (NSNumber)brailleAlerts
{
  return self->_brailleAlerts;
}

- (void)setBrailleAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_brailleAlerts, a3);
}

- (NSNumber)brailleFormatting
{
  return self->_brailleFormatting;
}

- (void)setBrailleFormatting:(id)a3
{
  objc_storeStrong((id *)&self->_brailleFormatting, a3);
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (AXCVoiceSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setVoiceSelection:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSelection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_brailleFormatting, 0);
  objc_storeStrong((id *)&self->_brailleAlerts, 0);
  objc_storeStrong((id *)&self->_brailleAutoAdvanceDuration, 0);
  objc_storeStrong((id *)&self->_brailleInput, 0);
  objc_storeStrong((id *)&self->_brailleOutput, 0);
  objc_storeStrong((id *)&self->_brailleInputTable, 0);
  objc_storeStrong((id *)&self->_brailleTable, 0);
  objc_storeStrong((id *)&self->_brailleStatusCellText, 0);
  objc_storeStrong((id *)&self->_brailleStatusCellGeneral, 0);
  objc_storeStrong((id *)&self->_modifierKeys, 0);
  objc_storeStrong((id *)&self->_audioDucking, 0);
  objc_storeStrong((id *)&self->_soundMuted, 0);
  objc_storeStrong((id *)&self->_speechMuted, 0);
  objc_storeStrong((id *)&self->_navigationStyle, 0);
  objc_storeStrong((id *)&self->_typingStyle, 0);
  objc_storeStrong((id *)&self->_numberFeedback, 0);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_imageDescriptions, 0);
  objc_storeStrong((id *)&self->_containerFeedback, 0);
  objc_storeStrong((id *)&self->_speakEmojis, 0);
  objc_storeStrong((id *)&self->_tableRowAndColumn, 0);
  objc_storeStrong((id *)&self->_tableHeaders, 0);
  objc_storeStrong((id *)&self->_punctuationGroup, 0);
  objc_storeStrong((id *)&self->_appIdentifiers, 0);
  objc_storeStrong((id *)&self->_textualContexts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
