@implementation MADVISceneClassificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVISceneClassificationRequest)init
{
  MADVISceneClassificationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVISceneClassificationRequest;
  result = -[MADVISceneClassificationRequest init](&v3, sel_init);
  if (result)
  {
    result->_maximumLeafObservations = 15;
    result->_maximumHierarchicalObservations = 15;
    result->_classificationRevision = 3737841665;
    result->_significantEventRevision = 2;
    result->_nsfwRevision = 1;
    result->_recognizeObjectsRevision = 3737841667;
    result->_saliencyRevision = 3737841667;
  }
  return result;
}

- (MADVISceneClassificationRequest)initWithCoder:(id)a3
{
  id v4;
  MADVISceneClassificationRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADVISceneClassificationRequest;
  v5 = -[MADRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_maximumLeafObservations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumLeafObservations"));
    v5->_maximumHierarchicalObservations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumHierarchicalObservations"));
    v5->_classificationRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ClassificationRevision"));
    v5->_nsfwRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NSFWRevision"));
    v5->_significantEventRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SignificantEventRevision"));
    v5->_recognizeObjectsRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RecognizeObjectsRevision"));
    v5->_saliencyRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SaliencyRevision"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVISceneClassificationRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumLeafObservations, CFSTR("MaximumLeafObservations"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumHierarchicalObservations, CFSTR("MaximumHierarchicalObservations"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_classificationRevision, CFSTR("ClassificationRevision"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_nsfwRevision, CFSTR("NSFWRevision"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_significantEventRevision, CFSTR("SignificantEventRevision"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_recognizeObjectsRevision, CFSTR("RecognizeObjectsRevision"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_saliencyRevision, CFSTR("SaliencyRevision"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("classificationRevision: %lu, "), self->_classificationRevision);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumLeafObservations: %lu, "), self->_maximumLeafObservations);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumHierarchicalObservations: %lu, "), self->_maximumHierarchicalObservations);
  objc_msgSend(v3, "appendFormat:", CFSTR("nsfwRevision: %lu, "), self->_nsfwRevision);
  objc_msgSend(v3, "appendFormat:", CFSTR("significantEventRevision: %lu, "), self->_significantEventRevision);
  objc_msgSend(v3, "appendFormat:", CFSTR("recognizeObjectsRevision: %lu, "), self->_recognizeObjectsRevision);
  objc_msgSend(v3, "appendFormat:", CFSTR("saliencyRevision: %lu, "), self->_saliencyRevision);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (unint64_t)maximumLeafObservations
{
  return self->_maximumLeafObservations;
}

- (unint64_t)maximumHierarchicalObservations
{
  return self->_maximumHierarchicalObservations;
}

- (unint64_t)classificationRevision
{
  return self->_classificationRevision;
}

- (unint64_t)nsfwRevision
{
  return self->_nsfwRevision;
}

- (unint64_t)significantEventRevision
{
  return self->_significantEventRevision;
}

- (unint64_t)recognizeObjectsRevision
{
  return self->_recognizeObjectsRevision;
}

- (unint64_t)saliencyRevision
{
  return self->_saliencyRevision;
}

@end
