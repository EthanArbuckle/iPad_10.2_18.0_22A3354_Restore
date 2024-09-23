@implementation PHASEStreamNode

- (PHASEStreamNode)initWithEngine:(id)a3 actionTreeUniqueId:(UniqueObjectId)a4 nodeStringHashId:(unint64_t)a5 mixer:(id)a6 format:(id)a7 normalize:(BOOL)a8 targetLKFS:(id)a9
{
  unint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  PHASEStreamNode *v18;
  PHASEStreamNode *v19;
  PHASEStreamNode *v20;
  unint64_t v22;
  objc_super v23;

  v22 = a4.mStorage[1];
  v12 = a4.mStorage[0];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHASEStreamNode;
  v18 = -[PHASEStreamNode init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_engine, v14);
    v19->_actionTreeUniqueId.mStorage[0] = v12;
    v19->_actionTreeUniqueId.mStorage[1] = v22;
    v19->_nodeUID = a5;
    objc_storeStrong((id *)&v19->_mixer, a6);
    objc_storeStrong((id *)&v19->_format, a7);
    v19->_normalize = a8;
    objc_storeStrong((id *)&v19->_targetLKFS, a9);
    v20 = v19;
  }

  return v19;
}

- (PHASENumberMetaParameter)gainMetaParameter
{
  return self->_gainMetaParameter;
}

- (PHASENumberMetaParameter)rateMetaParameter
{
  return self->_rateMetaParameter;
}

- (PHASEMixer)mixer
{
  return self->_mixer;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (BOOL)normalize
{
  return self->_normalize;
}

- (NSNumber)targetLKFS
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (UniqueObjectId)actionTreeUniqueId
{
  unint64_t v2;
  unint64_t v3;
  UniqueObjectId result;

  v2 = self->_actionTreeUniqueId.mStorage[1];
  v3 = self->_actionTreeUniqueId.mStorage[0];
  result.mStorage[1] = v2;
  result.mStorage[0] = v3;
  return result;
}

- (unint64_t)nodeUID
{
  return self->_nodeUID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_targetLKFS, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_rateMetaParameter, 0);
  objc_storeStrong((id *)&self->_gainMetaParameter, 0);
}

@end
