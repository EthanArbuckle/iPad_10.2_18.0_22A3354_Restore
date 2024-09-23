@implementation GEORawPathGeometry

- (GEORawPathGeometry)initWithRawData:(id)a3 pathMatcherInstructions:(id)a4
{
  id v7;
  id v8;
  GEORawPathGeometry *v9;
  GEORawPathGeometry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEORawPathGeometry;
  v9 = -[GEORawPathGeometry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawData, a3);
    objc_storeStrong((id *)&v10->_pathMatcherInstructions, a4);
  }

  return v10;
}

- (GEOPathMapMatcherInstructions)pathMatcherInstructions
{
  return self->_pathMatcherInstructions;
}

- (RoutingPathLeg)decompressedPathData
{
  RoutingPathLeg *result;

  +[PathCodec routingPathLegForData:](self->_rawData, (maps::path_codec::geo3::RoutingPathLeg *)retstr);
  +[PathCodec decompressInPlace:]((uint64_t)PathCodec, (uint64_t)retstr);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawData, CFSTR("_rawData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pathMatcherInstructions, CFSTR("_pathMatcherInstructions"));

}

- (GEORawPathGeometry)initWithCoder:(id)a3
{
  id v4;
  GEORawPathGeometry *v5;
  uint64_t v6;
  NSData *rawData;
  uint64_t v8;
  GEOPathMapMatcherInstructions *pathMatcherInstructions;
  GEORawPathGeometry *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORawPathGeometry;
  v5 = -[GEORawPathGeometry init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rawData"));
    v6 = objc_claimAutoreleasedReturnValue();
    rawData = v5->_rawData;
    v5->_rawData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pathMatcherInstructions"));
    v8 = objc_claimAutoreleasedReturnValue();
    pathMatcherInstructions = v5->_pathMatcherInstructions;
    v5->_pathMatcherInstructions = (GEOPathMapMatcherInstructions *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMatcherInstructions, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
