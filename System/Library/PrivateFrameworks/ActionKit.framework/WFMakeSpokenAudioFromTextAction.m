@implementation WFMakeSpokenAudioFromTextAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFMakeSpokenAudioFromTextAction;
  -[WFMakeSpokenAudioFromTextAction initializeParameters](&v4, sel_initializeParameters);
  -[WFMakeSpokenAudioFromTextAction voicePickerParameter](self, "voicePickerParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (id)voicePickerParameter
{
  void *v4;
  void *v6;

  -[WFMakeSpokenAudioFromTextAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSpeakTextVoice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMakeSpokenAudioFromTextAction.m"), 39, CFSTR("Parameter should be of type WFSpeakTextVoicePickerParameter"));

  }
  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__WFMakeSpokenAudioFromTextAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB768;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentation:", v3);
}

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
  -[WFMakeSpokenAudioFromTextAction finishRunningWithError:](self, "finishRunningWithError:", a5, a4);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5
{
  id v6;
  void *v7;

  if (a5)
  {
    v6 = a5;
    -[WFMakeSpokenAudioFromTextAction output](self, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFile:", v6);

  }
  -[WFMakeSpokenAudioFromTextAction finishRunningWithError:](self, "finishRunningWithError:", 0, a4);
}

- (WFSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizer, 0);
}

void __62__WFMakeSpokenAudioFromTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFSpeechSynthesizer *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc_init(WFSpeechSynthesizer);
    -[WFSpeechSynthesizer setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), v7);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextRate"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextPitch"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextLanguage"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 32);
    if (v14)
    {
      objc_msgSend(v15, "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextVoice"), objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFSpeechSynthesisVoice voiceForIdentifier:](WFSpeechSynthesisVoice, "voiceForIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSpeechSynthesizer speakUtteranceIntoFile:usingVoice:rate:pitch:](v7, "speakUtteranceIntoFile:usingVoice:rate:pitch:", v5, v17, v10, v13);

    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD1128];
      v23 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please select a language to use when speaking."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 5, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishRunningWithError:", v22);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

@end
