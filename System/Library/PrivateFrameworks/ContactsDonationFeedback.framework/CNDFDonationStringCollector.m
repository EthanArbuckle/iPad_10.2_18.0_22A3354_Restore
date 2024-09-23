@implementation CNDFDonationStringCollector

- (CNDFDonationStringCollector)init
{
  CNDFDonationStringCollector *v2;
  uint64_t v3;
  NSMutableArray *visitedStrings;
  CNDFDonationStringCollector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNDFDonationStringCollector;
  v2 = -[CNDFDonationStringCollector init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    visitedStrings = v2->_visitedStrings;
    v2->_visitedStrings = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector visitedStrings](self, "visitedStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("strings"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)strings
{
  void *v2;
  void *v3;

  -[CNDFDonationStringCollector visitedStrings](self, "visitedStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)collectStringsFromDonation:(id)a3
{
  objc_msgSend(a3, "acceptDonationValueVisitor:", self);
}

- (void)_addNonEmptyString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191D8] + 16))())
  {
    -[CNDFDonationStringCollector visitedStrings](self, "visitedStrings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)visitDonationValue:(id)a3 nameComponents:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(v5, "namePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v6);

  objc_msgSend(v5, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v7);

  objc_msgSend(v5, "middleName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v8);

  objc_msgSend(v5, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v9);

  objc_msgSend(v5, "nameSuffix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v10);

  objc_msgSend(v5, "nickname");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v11);
}

- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5
{
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", a4);
}

- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5
{
  id v6;

  objc_msgSend(a4, "stringValue", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v6);

}

- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  objc_msgSend(v7, "street");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v8);

  objc_msgSend(v7, "subLocality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v9);

  objc_msgSend(v7, "city");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v10);

  objc_msgSend(v7, "subAdministrativeArea");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v11);

  objc_msgSend(v7, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v12);

  objc_msgSend(v7, "postalCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v13);

  objc_msgSend(v7, "country");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v14);

  objc_msgSend(v7, "ISOCountryCode");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v15);
}

- (void)visitDonationValue:(id)a3 imageData:(id)a4
{
  id v5;

  objc_msgSend(a4, "base64EncodedStringWithOptions:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNDFDonationStringCollector _addNonEmptyString:](self, "_addNonEmptyString:", v5);

}

- (NSMutableArray)visitedStrings
{
  return self->_visitedStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedStrings, 0);
}

@end
