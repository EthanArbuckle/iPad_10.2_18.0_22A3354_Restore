@implementation _CNImageDataDonationValue

- (_CNImageDataDonationValue)initWithImageData:(id)a3 origin:(id)a4
{
  id v6;
  _CNImageDataDonationValue *v7;
  uint64_t v8;
  NSData *imageData;
  _CNImageDataDonationValue *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNImageDataDonationValue;
  v7 = -[CNDonationValue initWithOrigin:](&v12, sel_initWithOrigin_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    imageData = v7->_imageData;
    v7->_imageData = (NSData *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNDonationValue origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setExpirationDate:", v4);
  v7 = objc_alloc((Class)objc_opt_class());
  -[_CNImageDataDonationValue imageData](self, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithImageData:origin:", v8, v6);

  return v9;
}

- (_CNImageDataDonationValue)initWithCoder:(id)a3
{
  id v4;
  _CNImageDataDonationValue *v5;
  void *v6;
  uint64_t v7;
  NSData *imageData;
  _CNImageDataDonationValue *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNImageDataDonationValue;
  v5 = -[CNDonationValue initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNImageDataDonationValue;
  v4 = a3;
  -[CNDonationValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _CNImageDataDonationValue *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __37___CNImageDataDonationValue_isEqual___block_invoke;
  v16[3] = &unk_24C235F78;
  v16[4] = self;
  v17 = v4;
  v10 = v5;
  v11 = 3221225472;
  v12 = __37___CNImageDataDonationValue_isEqual___block_invoke_2;
  v13 = &unk_24C235F78;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = (void *)MEMORY[0x20BD1799C](&v10);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, v10, v11, v12, v13, v14);

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x24BE19288];
  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33___CNImageDataDonationValue_hash__block_invoke;
  v7[3] = &unk_24C235FA0;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33___CNImageDataDonationValue_hash__block_invoke_2;
  v6[3] = &unk_24C235FA0;
  v3 = (void *)MEMORY[0x20BD1799C](v6, a2);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNImageDataDonationValue imageData](self, "imageData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitDonationValue:imageData:", self, v5);

}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
