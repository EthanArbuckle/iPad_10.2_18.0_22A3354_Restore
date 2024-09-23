@implementation CSSceneClassification

- (CSSceneClassification)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5 sceneIdentifier:(unint64_t)a6
{
  CSSceneClassification *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSSceneClassification;
  result = -[CSExternalAnalysisTag initWithLabel:synonyms:confidence:](&v8, sel_initWithLabel_synonyms_confidence_, a3, a4, a5);
  if (result)
  {
    result->_sceneIdentifier = a6;
    result->_sceneType = 1;
    result->_mediaType = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSSceneClassification;
  v4 = a3;
  -[CSExternalAnalysisTag encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sceneType, CFSTR("sceneType"));

}

- (CSSceneClassification)initWithCoder:(id)a3
{
  id v4;
  CSSceneClassification *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSSceneClassification;
  v5 = -[CSExternalAnalysisTag initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_sceneIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sceneIdentifier"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sceneType")))
      v5->_sceneType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sceneType"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:synonyms:confidence:sceneIdentifier:", self->super._label, self->super._synonyms, self->_sceneIdentifier, self->super._confidence);
  objc_msgSend(v4, "setBoundingBox:", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend(v4, "setSceneType:", self->_sceneType);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t sceneIdentifier;
  int64_t sceneType;
  int64_t mediaType;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)CSSceneClassification;
    if (-[CSExternalAnalysisTag isEqual:](&v11, sel_isEqual_, v5)
      && (sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == objc_msgSend(v5, "sceneIdentifier"))
      && (sceneType = self->_sceneType, sceneType == objc_msgSend(v5, "sceneType")))
    {
      mediaType = self->_mediaType;
      v9 = mediaType == objc_msgSend(v5, "mediaType");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSceneClassification;
  v3 = -[CSExternalAnalysisTag hash](&v6, sel_hash);
  v4 = MDUHash64(self->_sceneIdentifier);
  return v4 ^ v3 ^ MDUHash64(self->_sceneType);
}

- (id)description
{
  void *v3;
  void *v4;
  double x;
  double y;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p %@"), objc_opt_class(), self, self->super._label);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->super._confidence != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" confidence: %f"), *(_QWORD *)&self->super._confidence);
  if (self->_sceneIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR(" id: %llu"), self->_sceneIdentifier);
  if (self->_sceneType)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sceneType: %u"), self->_sceneType);
  if (self->_mediaType)
    objc_msgSend(v4, "appendFormat:", CFSTR(" mediaType: %u"), self->_mediaType);
  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  if (x != 0.0 || y != 0.0 || self->_boundingBox.size.width != 0.0 || self->_boundingBox.size.height != 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" bounding: (x: %f, y: %f, w: %f,  h: %f)"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&self->_boundingBox.size.width, *(_QWORD *)&self->_boundingBox.size.height);
  objc_msgSend(v4, "appendFormat:", CFSTR(" label: %@"), self->super._label);
  if (-[NSArray count](self->super._synonyms, "count"))
  {
    -[NSArray componentsJoinedByString:](self->super._synonyms, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" synonyms: <%@>"), v7);

  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  self->_sceneIdentifier = a3;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_boundingBox, &v3, 32, 1, 0);
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(int64_t)a3
{
  self->_sceneType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void)encodeWithCSCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "beginType:", "CSSceneClassification");
  -[CSExternalAnalysisTag label](self, "label");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  -[CSExternalAnalysisTag synonyms](self, "synonyms");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v15, "encodeObject:", v7);

  -[CSExternalAnalysisTag confidence](self, "confidence");
  objc_msgSend(v15, "encodeDouble:");
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification sceneIdentifier](self, "sceneIdentifier"));
  -[CSSceneClassification boundingBox](self, "boundingBox");
  v11 = v8;
  v12 = v9;
  v13 = v10;
  if (v14 != 0.0 || v8 != 0.0 || v9 != 0.0 || v10 != 0.0)
  {
    objc_msgSend(v15, "encodeDouble:");
    objc_msgSend(v15, "encodeDouble:", v11);
    objc_msgSend(v15, "encodeDouble:", v12);
    objc_msgSend(v15, "encodeDouble:", v13);
  }
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification sceneType](self, "sceneType"));
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification mediaType](self, "mediaType"));
  objc_msgSend(v15, "endType");

}

@end
