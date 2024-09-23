@implementation MADVISceneClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setClassificationObservations:(id)a3
{
  objc_storeStrong((id *)&self->_classificationObservations, a3);
}

- (void)setNSFWObservations:(id)a3
{
  objc_storeStrong((id *)&self->_nsfwObservations, a3);
}

- (void)setSignificantEventObservations:(id)a3
{
  objc_storeStrong((id *)&self->_significantEventObservations, a3);
}

- (void)setRecognizedObjectObservations:(id)a3
{
  objc_storeStrong((id *)&self->_recognizedObjectObservations, a3);
}

- (void)setSaliencyObservations:(id)a3
{
  objc_storeStrong((id *)&self->_saliencyObservations, a3);
}

- (MADVISceneClassificationResult)initWithCoder:(id)a3
{
  id v4;
  MADVISceneClassificationResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *classificationObservations;
  uint64_t v17;
  NSArray *nsfwObservations;
  uint64_t v19;
  NSArray *significantEventObservations;
  uint64_t v21;
  NSArray *recognizedObjectObservations;
  uint64_t v23;
  NSArray *saliencyObservations;
  objc_super v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MADVISceneClassificationResult;
  v5 = -[MADResult initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v7 = (void *)getVNClassificationObservationClass_softClass;
    v35 = getVNClassificationObservationClass_softClass;
    if (!getVNClassificationObservationClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getVNClassificationObservationClass_block_invoke;
      v30 = &unk_1E97E2300;
      v31 = &v32;
      __getVNClassificationObservationClass_block_invoke((uint64_t)&v27);
      v7 = (void *)v33[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v32, 8);
    v36[1] = objc_opt_class();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v9 = (void *)getVNRecognizedObjectObservationClass_softClass;
    v35 = getVNRecognizedObjectObservationClass_softClass;
    if (!getVNRecognizedObjectObservationClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getVNRecognizedObjectObservationClass_block_invoke;
      v30 = &unk_1E97E2300;
      v31 = &v32;
      __getVNRecognizedObjectObservationClass_block_invoke((uint64_t)&v27);
      v9 = (void *)v33[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v32, 8);
    v36[2] = objc_opt_class();
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v11 = (void *)getVNSaliencyImageObservationClass_softClass;
    v35 = getVNSaliencyImageObservationClass_softClass;
    if (!getVNSaliencyImageObservationClass_softClass)
    {
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __getVNSaliencyImageObservationClass_block_invoke;
      v30 = &unk_1E97E2300;
      v31 = &v32;
      __getVNSaliencyImageObservationClass_block_invoke((uint64_t)&v27);
      v11 = (void *)v33[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v32, 8);
    v36[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("ClassificationObservations"));
    v15 = objc_claimAutoreleasedReturnValue();
    classificationObservations = v5->_classificationObservations;
    v5->_classificationObservations = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("NSFWObservations"));
    v17 = objc_claimAutoreleasedReturnValue();
    nsfwObservations = v5->_nsfwObservations;
    v5->_nsfwObservations = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("SignificantEventObservations"));
    v19 = objc_claimAutoreleasedReturnValue();
    significantEventObservations = v5->_significantEventObservations;
    v5->_significantEventObservations = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("RecognizedObjectObservations"));
    v21 = objc_claimAutoreleasedReturnValue();
    recognizedObjectObservations = v5->_recognizedObjectObservations;
    v5->_recognizedObjectObservations = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("SaliencyObservations"));
    v23 = objc_claimAutoreleasedReturnValue();
    saliencyObservations = v5->_saliencyObservations;
    v5->_saliencyObservations = (NSArray *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVISceneClassificationResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_classificationObservations, CFSTR("ClassificationObservations"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_nsfwObservations, CFSTR("NSFWObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_significantEventObservations, CFSTR("SignificantEventObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recognizedObjectObservations, CFSTR("RecognizedObjectObservations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_saliencyObservations, CFSTR("SaliencyObservations"));

}

- (unint64_t)executionNanoseconds
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVISceneClassificationResult;
  return -[MADResult executionNanoseconds](&v3, sel_executionNanoseconds);
}

- (double)executionTimeInterval
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVISceneClassificationResult;
  -[MADResult executionTimeInterval](&v3, sel_executionTimeInterval);
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("\nclassification observations:\n "));
  if (-[NSArray count](self->_classificationObservations, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_classificationObservations, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v9 = ",";
      else
        v9 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_classificationObservations, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ classification identifier=\"%@\"), v9, v10, v8);

      ++v6;
    }
    while (v6 < -[NSArray count](self->_classificationObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nnsfw observations:\n "));
  if (-[NSArray count](self->_nsfwObservations, "count"))
  {
    v11 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_nsfwObservations, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v14 = ",";
      else
        v14 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_nsfwObservations, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ nsfw identifier=\"%@\"), v14, v15, v13);

      ++v11;
    }
    while (v11 < -[NSArray count](self->_nsfwObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nsignificant event observations:\n "));
  if (-[NSArray count](self->_significantEventObservations, "count"))
  {
    v16 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_significantEventObservations, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        v19 = ",";
      else
        v19 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_significantEventObservations, "objectAtIndexedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ significant event identifier=\"%@\"), v19, v20, v18);

      ++v16;
    }
    while (v16 < -[NSArray count](self->_significantEventObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nrecognized object observations:\n "));
  if (-[NSArray count](self->_recognizedObjectObservations, "count"))
  {
    v21 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_recognizedObjectObservations, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "labels");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        v24 = ",";
      else
        v24 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_recognizedObjectObservations, "objectAtIndexedSubscript:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ recognized object labels=\"%@\"), v24, v25, v23);

      ++v21;
    }
    while (v21 < -[NSArray count](self->_recognizedObjectObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\nsalient object observations:\n "));
  if (-[NSArray count](self->_saliencyObservations, "count"))
  {
    v26 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_saliencyObservations, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "salientObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        v29 = ",";
      else
        v29 = (const char *)&unk_1D464FAA5;
      -[NSArray objectAtIndexedSubscript:](self->_saliencyObservations, "objectAtIndexedSubscript:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%s%@ salient objects=\"%@\"), v29, v30, v28);

      ++v26;
    }
    while (v26 < -[NSArray count](self->_saliencyObservations, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)classificationObservations
{
  return self->_classificationObservations;
}

- (NSArray)nsfwObservations
{
  return self->_nsfwObservations;
}

- (NSArray)significantEventObservations
{
  return self->_significantEventObservations;
}

- (NSArray)recognizedObjectObservations
{
  return self->_recognizedObjectObservations;
}

- (NSArray)saliencyObservations
{
  return self->_saliencyObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saliencyObservations, 0);
  objc_storeStrong((id *)&self->_recognizedObjectObservations, 0);
  objc_storeStrong((id *)&self->_significantEventObservations, 0);
  objc_storeStrong((id *)&self->_nsfwObservations, 0);
  objc_storeStrong((id *)&self->_classificationObservations, 0);
}

@end
