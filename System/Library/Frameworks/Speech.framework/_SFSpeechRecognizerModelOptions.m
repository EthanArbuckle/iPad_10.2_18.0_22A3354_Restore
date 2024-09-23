@implementation _SFSpeechRecognizerModelOptions

- (_SFSpeechRecognizerModelOptions)initWithFarField:(BOOL)a3 supplementalModelURL:(id)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 userIdMask:(id)a7 taskForMemoryLock:(id)a8 atypicalSpeech:(BOOL)a9 enableParallelLoading:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  _SFSpeechRecognizerModelOptions *v20;
  _SFSpeechRecognizerModelOptions *v21;
  id v24;
  objc_super v25;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v24 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_SFSpeechRecognizerModelOptions;
  v20 = -[_SFSpeechRecognizerModelOptions init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_farField = a3;
    objc_storeStrong((id *)&v20->_supplementalModelURL, a4);
    objc_storeStrong((id *)&v21->_modelOverrideURL, a5);
    objc_storeStrong((id *)&v21->_speechProfileURLs, a6);
    objc_storeStrong((id *)&v21->_userIdMask, a7);
    objc_storeStrong((id *)&v21->_taskForMemoryLock, a8);
    v21->_atypicalSpeech = a9;
    v21->_enableParallelLoading = a10;
  }

  return v21;
}

- (_SFSpeechRecognizerModelOptions)initWithFarField:(BOOL)a3 supplementalModelURL:(id)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8 enableParallelLoading:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  _SFSpeechRecognizerModelOptions *v19;
  _SFSpeechRecognizerModelOptions *v20;
  objc_super v23;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_SFSpeechRecognizerModelOptions;
  v19 = -[_SFSpeechRecognizerModelOptions init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_farField = a3;
    objc_storeStrong((id *)&v19->_supplementalModelURL, a4);
    objc_storeStrong((id *)&v20->_modelOverrideURL, a5);
    objc_storeStrong((id *)&v20->_speechProfileURLs, a6);
    objc_storeStrong((id *)&v20->_taskForMemoryLock, a7);
    v20->_atypicalSpeech = a8;
    v20->_enableParallelLoading = a9;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 farField;
  id v5;

  farField = self->_farField;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", farField, CFSTR("_farField"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supplementalModelURL, CFSTR("_supplementalModelURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelOverrideURL, CFSTR("_modelOverrideURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechProfileURLs, CFSTR("_speechProfileURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdMask, CFSTR("_userIdMask"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taskForMemoryLock, CFSTR("_taskForMemoryLock"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_atypicalSpeech, CFSTR("_atypicalSpeech"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableParallelLoading, CFSTR("_enableParallelLoading"));

}

- (_SFSpeechRecognizerModelOptions)initWithCoder:(id)a3
{
  id v4;
  _SFSpeechRecognizerModelOptions *v5;
  uint64_t v6;
  NSURL *supplementalModelURL;
  uint64_t v8;
  NSURL *modelOverrideURL;
  uint64_t v10;
  NSArray *speechProfileURLs;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *userIdMask;
  uint64_t v15;
  NSString *taskForMemoryLock;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFSpeechRecognizerModelOptions;
  v5 = -[_SFSpeechRecognizerModelOptions init](&v18, sel_init);
  if (v5)
  {
    v5->_farField = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_farField"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_supplementalModelURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    supplementalModelURL = v5->_supplementalModelURL;
    v5->_supplementalModelURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelOverrideURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_speechProfileURLs"));
    v10 = objc_claimAutoreleasedReturnValue();
    speechProfileURLs = v5->_speechProfileURLs;
    v5->_speechProfileURLs = (NSArray *)v10;

    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v12, objc_opt_class(), CFSTR("_userIdMask"));
    v13 = objc_claimAutoreleasedReturnValue();
    userIdMask = v5->_userIdMask;
    v5->_userIdMask = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_taskForMemoryLock"));
    v15 = objc_claimAutoreleasedReturnValue();
    taskForMemoryLock = v5->_taskForMemoryLock;
    v5->_taskForMemoryLock = (NSString *)v15;

    v5->_atypicalSpeech = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_atypicalSpeech"));
    v5->_enableParallelLoading = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enableParallelLoading"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _SFSpeechRecognizerModelOptions *v4;
  _SFSpeechRecognizerModelOptions *v5;
  int farField;
  int v7;
  NSURL *supplementalModelURL;
  int v9;
  BOOL v10;
  NSURL *modelOverrideURL;
  int v12;
  NSArray *speechProfileURLs;
  int v14;
  NSDictionary *userIdMask;
  NSString *taskForMemoryLock;
  unint64_t v17;
  int v18;

  v4 = (_SFSpeechRecognizerModelOptions *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[_SFSpeechRecognizerModelOptions isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    farField = self->_farField;
    v7 = v5->_farField;
    supplementalModelURL = self->_supplementalModelURL;
    if ((unint64_t)supplementalModelURL | (unint64_t)v5->_supplementalModelURL)
      v9 = -[NSURL isEqual:](supplementalModelURL, "isEqual:") ^ 1;
    else
      v9 = 0;
    modelOverrideURL = self->_modelOverrideURL;
    if ((unint64_t)modelOverrideURL | (unint64_t)v5->_modelOverrideURL)
      v12 = -[NSURL isEqual:](modelOverrideURL, "isEqual:") ^ 1;
    else
      v12 = 0;
    speechProfileURLs = self->_speechProfileURLs;
    if ((unint64_t)speechProfileURLs | (unint64_t)v5->_speechProfileURLs)
      v14 = !-[NSArray isEqualToArray:](speechProfileURLs, "isEqualToArray:");
    else
      v14 = 0;
    userIdMask = self->_userIdMask;
    if ((unint64_t)userIdMask | (unint64_t)v5->_userIdMask)
      -[NSDictionary isEqualToDictionary:](userIdMask, "isEqualToDictionary:");
    taskForMemoryLock = self->_taskForMemoryLock;
    v17 = (unint64_t)taskForMemoryLock | (unint64_t)v5->_taskForMemoryLock;
    if (v17)
      LOBYTE(v17) = !-[NSString isEqualToString:](taskForMemoryLock, "isEqualToString:");
    v10 = 0;
    if (farField == v7)
      v18 = v9;
    else
      v18 = 1;
    if (((v18 | v12 | v14) & 1) == 0 && (v17 & 1) == 0)
      v10 = self->_enableParallelLoading == v5->_enableParallelLoading && self->_atypicalSpeech == v5->_atypicalSpeech;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_farField)
    v3 = 1364;
  else
    v3 = 2263;
  v4 = v3 + -[NSURL hash](self->_supplementalModelURL, "hash");
  v5 = -[NSURL hash](self->_modelOverrideURL, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_speechProfileURLs, "hash") - v5 + 32 * v5;
  v7 = -[NSDictionary hash](self->_userIdMask, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_taskForMemoryLock, "hash");
  v9 = 13;
  if (self->_atypicalSpeech)
    v10 = 13;
  else
    v10 = 42;
  if (!self->_enableParallelLoading)
    v9 = 42;
  v11 = v10 - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return v9 - v11 + 32 * v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_SFSpeechRecognizerModelOptions: farField %d, supplementalModelURL %@, modelOverrideURL %@, speechProfileURLs %@, userIdMask %@, taskForMemoryLock %@, atypicalSpeech %d, enableParallelLoading %d>"), self->_farField, self->_supplementalModelURL, self->_modelOverrideURL, self->_speechProfileURLs, self->_userIdMask, self->_taskForMemoryLock, self->_atypicalSpeech, self->_enableParallelLoading);
}

- (BOOL)farField
{
  return self->_farField;
}

- (NSURL)supplementalModelURL
{
  return self->_supplementalModelURL;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSArray)speechProfileURLs
{
  return self->_speechProfileURLs;
}

- (NSDictionary)userIdMask
{
  return self->_userIdMask;
}

- (NSString)taskForMemoryLock
{
  return self->_taskForMemoryLock;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (BOOL)enableParallelLoading
{
  return self->_enableParallelLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskForMemoryLock, 0);
  objc_storeStrong((id *)&self->_userIdMask, 0);
  objc_storeStrong((id *)&self->_speechProfileURLs, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_supplementalModelURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
