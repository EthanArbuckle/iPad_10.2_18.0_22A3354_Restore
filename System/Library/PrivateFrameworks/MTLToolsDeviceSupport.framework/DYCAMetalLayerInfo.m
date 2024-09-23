@implementation DYCAMetalLayerInfo

- (DYCAMetalLayerInfo)initWithCoder:(id)a3
{
  id v4;
  DYCAMetalLayerInfo *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  NSString *name;
  NSString *v12;
  NSString *displayName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DYCAMetalLayerInfo;
  v5 = -[DYCAMetalLayerInfo init](&v15, sel_init);
  if (v5)
  {
    v5->_deviceAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_layerAddress = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layerAddress"));
    v5->_layerStreamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layerStreamRef"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frame"));
    v5->_frame.origin.x = v6;
    v5->_frame.origin.y = v7;
    v5->_frame.size.width = v8;
    v5->_frame.size.height = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    if (-[NSString length](v5->_name, "length"))
    {
      v12 = v5->_name;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08llx [%.0f,%.0f %.0f×%.0f]"), v5->_layerAddress, *(_QWORD *)&v5->_frame.origin.x, *(_QWORD *)&v5->_frame.origin.y, *(_QWORD *)&v5->_frame.size.width, *(_QWORD *)&v5->_frame.size.height);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = v5->_displayName;
    v5->_displayName = v12;

  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x24BE392A0];
}

- (unint64_t)streamRef
{
  return self->_layerStreamRef;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->_layerAddress == v4[3];

  return v6;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)layerAddress
{
  return self->_layerAddress;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)layerStreamRef
{
  return self->_layerStreamRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
