@implementation SFSpeechRecognitionResult

- (unint64_t)hash
{
  return -[SFTranscription hash](self->_bestTranscription, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SFSpeechRecognitionMetadata **v4;
  SFTranscription *bestTranscription;
  SFSpeechRecognitionMetadata *speechRecognitionMetadata;
  BOOL v7;

  v4 = (SFSpeechRecognitionMetadata **)a3;
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_final == *((unsigned __int8 *)v4 + 24))
  {
    bestTranscription = self->_bestTranscription;
    if (bestTranscription == (SFTranscription *)v4[4] || -[SFTranscription isEqual:](bestTranscription, "isEqual:"))
    {
      speechRecognitionMetadata = self->_speechRecognitionMetadata;
      if (speechRecognitionMetadata == v4[5]
        || -[SFSpeechRecognitionMetadata isEqual:](speechRecognitionMetadata, "isEqual:"))
      {
        v7 = 1;
      }
    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSpeechRecognitionResult;
  -[SFSpeechRecognitionResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" final=%d, bestTranscription=%@, speechRecognitionMetadata=%@"), self->_final, self->_bestTranscription, self->_speechRecognitionMetadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SFSpeechRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  SFSpeechRecognitionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SFTranscription *bestTranscription;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SFTranscription *rawTranscription;
  uint64_t v16;
  SFSpeechRecognitionMetadata *speechRecognitionMetadata;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFSpeechRecognitionResult;
  v5 = -[SFSpeechRecognitionResult init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_bestTranscription"));
    v9 = objc_claimAutoreleasedReturnValue();
    bestTranscription = v5->_bestTranscription;
    v5->_bestTranscription = (SFTranscription *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_rawTranscription"));
    v14 = objc_claimAutoreleasedReturnValue();
    rawTranscription = v5->_rawTranscription;
    v5->_rawTranscription = (SFTranscription *)v14;

    v5->_final = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_final"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechRecognitionMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    speechRecognitionMetadata = v5->_speechRecognitionMetadata;
    v5->_speechRecognitionMetadata = (SFSpeechRecognitionMetadata *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SFTranscription *bestTranscription;
  id v5;

  bestTranscription = self->_bestTranscription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bestTranscription, CFSTR("_bestTranscription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawTranscription, CFSTR("_rawTranscription"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_final, CFSTR("_final"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechRecognitionMetadata, CFSTR("_speechRecognitionMetadata"));

}

- (id)_initWithBestTranscription:(id)a3 rawTranscription:(id)a4 final:(BOOL)a5 speechRecognitionMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  SFSpeechRecognitionResult *v13;
  uint64_t v14;
  SFTranscription *bestTranscription;
  uint64_t v16;
  SFTranscription *rawTranscription;
  uint64_t v18;
  SFSpeechRecognitionMetadata *speechRecognitionMetadata;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SFSpeechRecognitionResult;
  v13 = -[SFSpeechRecognitionResult init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    bestTranscription = v13->_bestTranscription;
    v13->_bestTranscription = (SFTranscription *)v14;

    v16 = objc_msgSend(v11, "copy");
    rawTranscription = v13->_rawTranscription;
    v13->_rawTranscription = (SFTranscription *)v16;

    v13->_final = a5;
    v18 = objc_msgSend(v12, "copy");
    speechRecognitionMetadata = v13->_speechRecognitionMetadata;
    v13->_speechRecognitionMetadata = (SFSpeechRecognitionMetadata *)v18;

  }
  return v13;
}

- (NSArray)transcriptions
{
  SFSpeechRecognitionResult *v2;
  NSArray *transcriptions;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;

  v2 = self;
  objc_sync_enter(v2);
  transcriptions = v2->_transcriptions;
  if (!transcriptions)
  {
    ExpandTranscription(v2->_bestTranscription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = v2->_transcriptions;
    v2->_transcriptions = (NSArray *)v5;

    transcriptions = v2->_transcriptions;
  }
  v7 = transcriptions;
  objc_sync_exit(v2);

  return v7;
}

- (NSArray)rawTranscriptions
{
  SFSpeechRecognitionResult *v2;
  NSArray *rawTranscriptions;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;

  v2 = self;
  objc_sync_enter(v2);
  rawTranscriptions = v2->_rawTranscriptions;
  if (!rawTranscriptions)
  {
    ExpandTranscription(v2->_rawTranscription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = v2->_rawTranscriptions;
    v2->_rawTranscriptions = (NSArray *)v5;

    rawTranscriptions = v2->_rawTranscriptions;
  }
  v7 = rawTranscriptions;
  objc_sync_exit(v2);

  return v7;
}

- (SFSpeechRecognitionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  SFSpeechRecognitionResult *v7;
  void *v8;
  void *v9;
  SFSpeechRecognitionResult *v10;
  SFSpeechRecognitionResult *v11;
  objc_super v13;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SFSpeechRecognitionResult;
    v7 = -[SFSpeechRecognitionResult init](&v13, sel_init);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v7 = v10;
      }

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)binarySampleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (SFTranscription)bestTranscription
{
  return self->_bestTranscription;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (SFSpeechRecognitionMetadata)speechRecognitionMetadata
{
  return self->_speechRecognitionMetadata;
}

- (SFTranscription)rawTranscription
{
  return self->_rawTranscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTranscription, 0);
  objc_storeStrong((id *)&self->_speechRecognitionMetadata, 0);
  objc_storeStrong((id *)&self->_bestTranscription, 0);
  objc_storeStrong((id *)&self->_rawTranscriptions, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
