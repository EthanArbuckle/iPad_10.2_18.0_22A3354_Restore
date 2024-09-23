@implementation VNObjectTracker

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  CFDictionaryRef DictionaryRepresentation;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];
  CGRect v15;

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v13 = v7;
      objc_msgSend(v6, "boundingBox");
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v15);
      v14[0] = DictionaryRepresentation;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      a5 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object identifier is not initialized in detected object observation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VNDetectedObjectObservation object is expected to initialize Object Tracker"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

@end
