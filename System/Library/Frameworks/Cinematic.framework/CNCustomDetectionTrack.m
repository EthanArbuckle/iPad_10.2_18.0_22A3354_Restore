@implementation CNCustomDetectionTrack

- (CNCustomDetectionTrack)initWithDetections:(NSArray *)detections smooth:(BOOL)applySmoothing
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  CNCustomDetectionTrack *v9;
  objc_super v11;

  v4 = applySmoothing;
  v6 = +[CNDetection _copyInternalFromDetections:](CNDetection, "_copyInternalFromDetections:", detections);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74B48]), "initWithDetections:", v6);
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "applyDetectionSmoothing");
  v11.receiver = self;
  v11.super_class = (Class)CNCustomDetectionTrack;
  v9 = -[CNDetectionTrack _initWithInternal:](&v11, sel__initWithInternal_, v8);

  return v9;
}

- (NSArray)allDetections
{
  void *v3;
  void *v4;
  id v5;

  if (-[CNCustomDetectionTrack _integrityCheck](self, "_integrityCheck"))
  {
    -[CNCustomDetectionTrack _internalCustomTrack](self, "_internalCustomTrack");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allDetections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNDetection _copyDetectionsFromInternal:](CNDetection, "_copyDetectionsFromInternal:", v4);

  }
  else
  {
    v5 = (id)MEMORY[0x24BDBD1A8];
  }
  return (NSArray *)v5;
}

- (BOOL)_integrityCheck
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;

  -[CNDetectionTrack internalTrack](self, "internalTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    _CNLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CNCustomDetectionTrack _integrityCheck].cold.1(self, v5);

  }
  return isKindOfClass & 1;
}

- (void)_integrityCheck
{
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internalTrack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_23307F000, a2, OS_LOG_TYPE_DEBUG, "%@ has unexpected internal type %@", (uint8_t *)&v9, 0x16u);

}

@end
