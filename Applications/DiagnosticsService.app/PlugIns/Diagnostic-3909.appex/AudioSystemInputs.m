@implementation AudioSystemInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSSet *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  unsigned __int8 v20;

  v4 = a3;
  v20 = 0;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("requiredFiles"), v6, 80, &v20, &stru_100010490));
  -[AudioSystemInputs setRequiredFiles:](self, "setRequiredFiles:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemInputs requiredFiles](self, "requiredFiles"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    v20 = 1;
  v10 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSArray));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("audioFilesPerOutputComponent"), v11, 2, &v20));

  if ((unint64_t)objc_msgSend(v12, "count") < 2 || v20)
  {
    v20 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemInputs requiredFiles](self, "requiredFiles"));
    v20 = -[AudioSystemInputs _applyComponentArrayParameter:requiredFiles:](self, "_applyComponentArrayParameter:requiredFiles:", v12, v13);

  }
  v14 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("accessoryModelNumbers"), v15, 50, &v20, &stru_1000104B0));
  -[AudioSystemInputs setAccessoryModelNumbers:](self, "setAccessoryModelNumbers:", v16);

  -[AudioSystemInputs setSequentialAudioInput:](self, "setSequentialAudioInput:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("sequentialAudioInput"), &v20));
  -[AudioSystemInputs setSendRawData:](self, "setSendRawData:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("sendRawData"), 0, &v20));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("xComponentAccelOrientationThreshold"), &off_1000108E0, &off_1000108F0, 0, &v20));
  -[AudioSystemInputs setXComponentAccelThreshold:](self, "setXComponentAccelThreshold:", v17);

  v18 = v20 == 0;
  return v18;
}

- (BOOL)_applyComponentArrayParameter:(id)a3 requiredFiles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009094;
  v13[3] = &unk_1000104D8;
  v10 = v8;
  v14 = v10;
  v16 = &v17;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  -[AudioSystemInputs setAudioFilesPerOutputComponent:](self, "setAudioFilesPerOutputComponent:", v11);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

- (NSArray)requiredFiles
{
  return self->_requiredFiles;
}

- (void)setRequiredFiles:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFiles, a3);
}

- (NSArray)audioFilesPerOutputComponent
{
  return self->_audioFilesPerOutputComponent;
}

- (void)setAudioFilesPerOutputComponent:(id)a3
{
  objc_storeStrong((id *)&self->_audioFilesPerOutputComponent, a3);
}

- (NSArray)accessoryModelNumbers
{
  return self->_accessoryModelNumbers;
}

- (void)setAccessoryModelNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryModelNumbers, a3);
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (NSNumber)xComponentAccelThreshold
{
  return self->_xComponentAccelThreshold;
}

- (void)setXComponentAccelThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_xComponentAccelThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xComponentAccelThreshold, 0);
  objc_storeStrong((id *)&self->_accessoryModelNumbers, 0);
  objc_storeStrong((id *)&self->_audioFilesPerOutputComponent, 0);
  objc_storeStrong((id *)&self->_requiredFiles, 0);
}

@end
