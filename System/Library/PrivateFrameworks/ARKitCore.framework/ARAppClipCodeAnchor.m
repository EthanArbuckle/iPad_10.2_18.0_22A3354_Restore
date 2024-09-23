@implementation ARAppClipCodeAnchor

- (ARAppClipCodeAnchor)initWithAppClipCodeResult:(id)a3 instanceID:(id)a4
{
  id v6;
  id v7;
  ARAppClipCodeAnchor *v8;
  uint64_t v9;
  NSURL *url;
  double v11;
  float v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARAppClipCodeAnchor;
  v8 = -[ARAnchor initWithTransform:](&v14, sel_initWithTransform_, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  if (v8)
  {
    objc_msgSend(v6, "url");
    v9 = objc_claimAutoreleasedReturnValue();
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_instanceID, a4);
    objc_msgSend(v6, "size");
    *(float *)&v11 = v11 * 0.5;
    v8->_radius = *(float *)&v11;
    objc_msgSend(v6, "confidence");
    v8->_confidence = v12;
    v8->_urlDecodingStateInternal = objc_msgSend(v6, "urlDecodingStateInternal");
    -[ARAppClipCodeAnchor setIsTracked:](v8, "setIsTracked:", 1);
    v8->_isScaleReliable = objc_msgSend(v6, "isScaleReliable");
    v8->_urlEncodingVersion = objc_msgSend(v6, "urlEncodingVersion");
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAppClipCodeAnchor instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAppClipCodeAnchor url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor transform](self, "transform");
  ARMatrix4x4Description(0, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p instanceID=%@ url=\"%@\" identifier=\"%@\" transform=%@>"), v5, self, v6, v8, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)-[ARAppClipCodeAnchor copy](self, "copy");
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isTracked") != v3)
    objc_msgSend(v5, "setIsTracked:", v3);
  return v5;
}

- (ARAppClipCodeAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARAppClipCodeAnchor *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSNumber *instanceID;
  float v10;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v13, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "instanceID");
    v8 = objc_claimAutoreleasedReturnValue();
    instanceID = v5->_instanceID;
    v5->_instanceID = (NSNumber *)v8;

    objc_msgSend(v4, "radius");
    v5->_radius = v10;
    objc_msgSend(v4, "confidence");
    v5->_confidence = v11;
    v5->_urlDecodingStateInternal = objc_msgSend(v4, "urlDecodingStateInternal");
    v5->_isTracked = objc_msgSend(v4, "isTracked");
    v5->_isScaleReliable = objc_msgSend(v4, "isScaleReliable");
    v5->_urlEncodingVersion = objc_msgSend(v4, "urlEncodingVersion");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARAppClipCodeAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ARAppClipCodeAnchor url](self, "url", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

  -[ARAppClipCodeAnchor instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("instanceID"));

  -[ARAppClipCodeAnchor confidence](self, "confidence");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("confidence"));
  -[ARAppClipCodeAnchor radius](self, "radius");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("radius"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARAppClipCodeAnchor urlDecodingStateInternal](self, "urlDecodingStateInternal"), CFSTR("urlDecodingStateInternal"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ARAppClipCodeAnchor isTracked](self, "isTracked"), CFSTR("isTracked"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ARAppClipCodeAnchor isScaleReliable](self, "isScaleReliable"), CFSTR("isScaleReliable"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARAppClipCodeAnchor urlEncodingVersion](self, "urlEncodingVersion"), CFSTR("urlEncodingVersion"));

}

- (ARAppClipCodeAnchor)initWithCoder:(id)a3
{
  id v4;
  ARAppClipCodeAnchor *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSNumber *instanceID;
  float v10;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeAnchor;
  v5 = -[ARAnchor initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceID"));
    v8 = objc_claimAutoreleasedReturnValue();
    instanceID = v5->_instanceID;
    v5->_instanceID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
    v5->_confidence = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("radius"));
    v5->_radius = v11;
    v5->_urlDecodingStateInternal = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urlDecodingStateInternal"));
    v5->_isTracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTracked"));
    v5->_isScaleReliable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isScaleReliable"));
    v5->_urlEncodingVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urlEncodingVersion"));
  }

  return v5;
}

- (ARAppClipCodeURLDecodingState)urlDecodingState
{
  unint64_t urlDecodingStateInternal;

  urlDecodingStateInternal = self->_urlDecodingStateInternal;
  if (urlDecodingStateInternal > 9)
    return 2;
  else
    return qword_1B3BE0278[urlDecodingStateInternal];
}

- (id)copyWithAppClipCodeResult:(id)a3 isTracked:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)-[ARAppClipCodeAnchor copy](self, "copy");
  if (v7)
  {
    objc_msgSend(v6, "size");
    v9 = v8 * 0.5;
    *(float *)&v9 = v9;
    objc_msgSend(v7, "setRadius:", v9);
    objc_msgSend(v6, "confidence");
    objc_msgSend(v7, "setConfidence:");
    objc_msgSend(v6, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUrl:", v10);

    objc_msgSend(v7, "setUrlDecodingStateInternal:", objc_msgSend(v6, "urlDecodingStateInternal"));
    objc_msgSend(v7, "setIsScaleReliable:", objc_msgSend(v6, "isScaleReliable"));
    objc_msgSend(v7, "setUrlEncodingVersion:", objc_msgSend(v6, "urlEncodingVersion"));
    objc_msgSend(v7, "setIsTracked:", v4);
  }

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceID, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int64_t)urlDecodingStateInternal
{
  return self->_urlDecodingStateInternal;
}

- (void)setUrlDecodingStateInternal:(int64_t)a3
{
  self->_urlDecodingStateInternal = a3;
}

- (BOOL)isScaleReliable
{
  return self->_isScaleReliable;
}

- (void)setIsScaleReliable:(BOOL)a3
{
  self->_isScaleReliable = a3;
}

- (unint64_t)urlEncodingVersion
{
  return self->_urlEncodingVersion;
}

- (void)setUrlEncodingVersion:(unint64_t)a3
{
  self->_urlEncodingVersion = a3;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
