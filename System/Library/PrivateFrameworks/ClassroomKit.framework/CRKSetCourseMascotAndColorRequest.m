@implementation CRKSetCourseMascotAndColorRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCourseMascotAndColorRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetCourseMascotAndColorRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKSetCourseMascotAndColorRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("courseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mascotType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mascotType = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_colorType = objc_msgSend(v10, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKSetCourseMascotAndColorRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKSetCourseMascotAndColorRequest courseIdentifier](self, "courseIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKSetCourseMascotAndColorRequest mascotType](self, "mascotType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mascotType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKSetCourseMascotAndColorRequest colorType](self, "colorType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("colorType"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (unint64_t)mascotType
{
  return self->_mascotType;
}

- (void)setMascotType:(unint64_t)a3
{
  self->_mascotType = a3;
}

- (unint64_t)colorType
{
  return self->_colorType;
}

- (void)setColorType:(unint64_t)a3
{
  self->_colorType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
