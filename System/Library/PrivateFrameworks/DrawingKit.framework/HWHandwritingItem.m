@implementation HWHandwritingItem

- (HWHandwritingItem)initWithDrawing:(id)a3
{
  id v4;
  HWHandwritingItem *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSDate *creationDate;
  uint64_t v10;
  DKDrawing *drawing;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HWHandwritingItem;
  v5 = -[HWHandwritingItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    v10 = objc_msgSend(v4, "copy");
    drawing = v5->_drawing;
    v5->_drawing = (DKDrawing *)v10;

  }
  return v5;
}

- (HWHandwritingItem)init
{
  return -[HWHandwritingItem initWithDrawing:](self, "initWithDrawing:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HWHandwritingItem *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSDate *creationDate;
  DKDrawing *v10;
  DKDrawing *drawing;

  v5 = objc_alloc_init(HWHandwritingItem);
  if (v5)
  {
    v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v8 = -[NSDate copyWithZone:](self->_creationDate, "copyWithZone:", a3);
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    v10 = -[DKDrawing copyWithZone:](self->_drawing, "copyWithZone:", a3);
    drawing = v5->_drawing;
    v5->_drawing = v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HWHandwritingItem)initWithCoder:(id)a3
{
  id v4;
  HWHandwritingItem *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSDate *creationDate;
  uint64_t v10;
  DKDrawing *drawing;

  v4 = a3;
  v5 = -[HWHandwritingItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cd1"));
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dw1"));
    v10 = objc_claimAutoreleasedReturnValue();
    drawing = v5->_drawing;
    v5->_drawing = (DKDrawing *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("cd1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_drawing, CFSTR("dw1"));

}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DKDrawing)drawing
{
  return (DKDrawing *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDrawing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
