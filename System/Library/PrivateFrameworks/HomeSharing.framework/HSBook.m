@implementation HSBook

- (HSBook)initWithCoder:(id)a3
{
  id v4;
  HSBook *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HSBook;
  v5 = -[HSBook init](&v15, sel_init);
  if (v5)
  {
    -[HSBook setPurchaseHistoryID:](v5, "setPurchaseHistoryID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HSPurchasedBookPurchaseHistoryID")));
    -[HSBook setStoreID:](v5, "setStoreID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HSPurchasedBookStoreID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookAuthor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setAuthor:](v5, "setAuthor:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookGenre"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setGenre:](v5, "setGenre:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookDatePurchased"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setDatePurchased:](v5, "setDatePurchased:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookArtworkURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setArtworkURL:](v5, "setArtworkURL:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookRedownloadParameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setRedownloadParameters:](v5, "setRedownloadParameters:", v11);

    -[HSBook setVppLicensed:](v5, "setVppLicensed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HSPurchasedBookVPPLicensed")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookVPPOrganizationID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setVppOrganizationID:](v5, "setVppOrganizationID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSPurchasedBookVPPOrganizationDisplayName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSBook setVppOrganizationDisplayName:](v5, "setVppOrganizationDisplayName:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[HSBook purchaseHistoryID](self, "purchaseHistoryID"), CFSTR("HSPurchasedBookPurchaseHistoryID"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HSBook storeID](self, "storeID"), CFSTR("HSPurchasedBookStoreID"));
  -[HSBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HSPurchasedBookTitle"));

  -[HSBook author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HSPurchasedBookAuthor"));

  -[HSBook genre](self, "genre");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HSPurchasedBookGenre"));

  -[HSBook datePurchased](self, "datePurchased");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HSPurchasedBookDatePurchased"));

  -[HSBook artworkURL](self, "artworkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HSPurchasedBookArtworkURL"));

  -[HSBook redownloadParameters](self, "redownloadParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HSPurchasedBookRedownloadParameters"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HSBook isVPPLicensed](self, "isVPPLicensed"), CFSTR("HSPurchasedBookVPPLicensed"));
  -[HSBook vppOrganizationID](self, "vppOrganizationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HSPurchasedBookVPPOrganizationID"));

  -[HSBook vppOrganizationDisplayName](self, "vppOrganizationDisplayName");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HSPurchasedBookVPPOrganizationDisplayName"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HSBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title='%@'>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (void)setPurchaseHistoryID:(unint64_t)a3
{
  self->_purchaseHistoryID = a3;
}

- (unint64_t)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(unint64_t)a3
{
  self->_storeID = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)datePurchased
{
  return self->_datePurchased;
}

- (void)setDatePurchased:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRedownloadParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isVPPLicensed
{
  return self->_vppLicensed;
}

- (void)setVppLicensed:(BOOL)a3
{
  self->_vppLicensed = a3;
}

- (NSString)vppOrganizationID
{
  return self->_vppOrganizationID;
}

- (void)setVppOrganizationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)vppOrganizationDisplayName
{
  return self->_vppOrganizationDisplayName;
}

- (void)setVppOrganizationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppOrganizationDisplayName, 0);
  objc_storeStrong((id *)&self->_vppOrganizationID, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
