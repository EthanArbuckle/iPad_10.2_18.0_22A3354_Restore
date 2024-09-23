@implementation CPSBannerItem

- (CPSBannerItem)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 textVariants:(id)a5 detailTextVariants:(id)a6 attributedDetailTextVariants:(id)a7 imageSet:(id)a8 isManeuverItem:(BOOL)a9
{
  CPSBannerItem *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSArray *textVariants;
  uint64_t v14;
  NSArray *detailTextVariants;
  uint64_t v16;
  NSArray *attributedDetailTextVariants;
  CPSBannerItem *v19;
  objc_super v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  CPSBannerItem *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = 0;
  objc_storeStrong(&v29, a6);
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = 0;
  objc_storeStrong(&v27, a8);
  v26 = a9;
  v9 = v33;
  v33 = 0;
  v25.receiver = v9;
  v25.super_class = (Class)CPSBannerItem;
  v33 = -[CPSBannerItem init](&v25, sel_init);
  objc_storeStrong((id *)&v33, v33);
  if (v33)
  {
    objc_storeStrong((id *)&v33->_identifier, location[0]);
    v10 = objc_msgSend(v31, "copy");
    bundleIdentifier = v33->_bundleIdentifier;
    v33->_bundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v30, "copy");
    textVariants = v33->_textVariants;
    v33->_textVariants = (NSArray *)v12;

    v14 = objc_msgSend(v29, "copy");
    detailTextVariants = v33->_detailTextVariants;
    v33->_detailTextVariants = (NSArray *)v14;

    v16 = objc_msgSend(v28, "copy");
    attributedDetailTextVariants = v33->_attributedDetailTextVariants;
    v33->_attributedDetailTextVariants = (NSArray *)v16;

    objc_storeStrong((id *)&v33->_imageSet, v27);
    v33->_isManeuverItem = v26;
  }
  v19 = v33;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v33, 0);
  return v19;
}

- (BOOL)isEqualToBannerItem:(id)a3
{
  char v4;
  char v5;
  char v6;
  NSArray *v7;
  char v8;
  char v9;
  NSArray *v10;
  char v11;
  char v12;
  NSArray *v13;
  char v14;
  id v15;
  char v16;
  NSUUID *v17;
  char v18;
  id v19;
  char v20;
  NSArray *v21;
  char v22;
  id v23;
  char v24;
  NSArray *v25;
  char v26;
  id v27;
  char v28;
  id v29;
  char v30;
  NSArray *v31;
  char v32;
  id v33;
  char v34;
  NSArray *v35;
  char v36;
  id v37;
  char v38;
  id v39;
  char v40;
  NSArray *v41;
  char v42;
  id v43;
  char v44;
  NSArray *v45;
  char v46;
  id v47;
  id location[2];
  CPSBannerItem *v49;
  char v50;

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = -[CPSBannerItem textVariants](v49, "textVariants");
  v46 = 0;
  v44 = 0;
  v42 = 0;
  v40 = 0;
  v38 = 0;
  if (v13
    || (v47 = (id)objc_msgSend(location[0], "textVariants"), v46 = 1, v12 = 1, v47))
  {
    v45 = -[CPSBannerItem textVariants](v49, "textVariants");
    v44 = 1;
    v11 = 0;
    if (v45)
    {
      v43 = (id)objc_msgSend(location[0], "textVariants");
      v42 = 1;
      v11 = 0;
      if (v43)
      {
        v41 = -[CPSBannerItem textVariants](v49, "textVariants");
        v40 = 1;
        v39 = (id)objc_msgSend(location[0], "textVariants");
        v38 = 1;
        v11 = -[NSArray isEqualToArray:](v41, "isEqualToArray:");
      }
    }
    v12 = v11;
  }
  if ((v38 & 1) != 0)

  if ((v40 & 1) != 0)
  if ((v42 & 1) != 0)

  if ((v44 & 1) != 0)
  if ((v46 & 1) != 0)

  v10 = -[CPSBannerItem detailTextVariants](v49, "detailTextVariants");
  v36 = 0;
  v34 = 0;
  v32 = 0;
  v30 = 0;
  v28 = 0;
  if (v10
    || (v37 = (id)objc_msgSend(location[0], "detailTextVariants"),
        v36 = 1,
        v9 = 1,
        v37))
  {
    v35 = -[CPSBannerItem detailTextVariants](v49, "detailTextVariants");
    v34 = 1;
    v8 = 0;
    if (v35)
    {
      v33 = (id)objc_msgSend(location[0], "detailTextVariants");
      v32 = 1;
      v8 = 0;
      if (v33)
      {
        v31 = -[CPSBannerItem detailTextVariants](v49, "detailTextVariants");
        v30 = 1;
        v29 = (id)objc_msgSend(location[0], "detailTextVariants");
        v28 = 1;
        v8 = -[NSArray isEqualToArray:](v31, "isEqualToArray:");
      }
    }
    v9 = v8;
  }
  if ((v28 & 1) != 0)

  if ((v30 & 1) != 0)
  if ((v32 & 1) != 0)

  if ((v34 & 1) != 0)
  if ((v36 & 1) != 0)

  v7 = -[CPSBannerItem attributedDetailTextVariants](v49, "attributedDetailTextVariants");
  v26 = 0;
  v24 = 0;
  v22 = 0;
  v20 = 0;
  v18 = 0;
  if (v7
    || (v27 = (id)objc_msgSend(location[0], "attributedDetailTextVariants"),
        v26 = 1,
        v6 = 1,
        v27))
  {
    v25 = -[CPSBannerItem attributedDetailTextVariants](v49, "attributedDetailTextVariants");
    v24 = 1;
    v5 = 0;
    if (v25)
    {
      v23 = (id)objc_msgSend(location[0], "attributedDetailTextVariants");
      v22 = 1;
      v5 = 0;
      if (v23)
      {
        v21 = -[CPSBannerItem attributedDetailTextVariants](v49, "attributedDetailTextVariants");
        v20 = 1;
        v19 = (id)objc_msgSend(location[0], "attributedDetailTextVariants");
        v18 = 1;
        v5 = -[NSArray isEqualToArray:](v21, "isEqualToArray:");
      }
    }
    v6 = v5;
  }
  if ((v18 & 1) != 0)

  if ((v20 & 1) != 0)
  if ((v22 & 1) != 0)

  if ((v24 & 1) != 0)
  if ((v26 & 1) != 0)

  v16 = 0;
  v14 = 0;
  v4 = 0;
  if ((v12 & 1) != 0)
  {
    v4 = 0;
    if ((v9 & 1) != 0)
    {
      v4 = 0;
      if ((v6 & 1) != 0)
      {
        v17 = -[CPSBannerItem identifier](v49, "identifier");
        v16 = 1;
        v15 = (id)objc_msgSend(location[0], "identifier");
        v14 = 1;
        v4 = -[NSUUID isEqual:](v17, "isEqual:");
      }
    }
  }
  v50 = v4 & 1;
  if ((v14 & 1) != 0)

  if ((v16 & 1) != 0)
  objc_storeStrong(location, 0);
  return v50 & 1;
}

- (BOOL)isEqual:(id)a3
{
  char v4;
  id location[2];
  CPSBannerItem *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = 0;
  if (v6 == location[0])
  {
    v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = -[CPSBannerItem isEqualToBannerItem:](v6, "isEqualToBannerItem:", location[0]);
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)description
{
  void *v3;
  NSString *v4;
  NSUUID *v5;
  CPImageSet *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;
  id v10;
  objc_super v11;
  SEL v12;
  CPSBannerItem *v13;

  v13 = self;
  v12 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)CPSBannerItem;
  v9 = -[CPSBannerItem description](&v11, sel_description);
  v8 = -[CPSBannerItem textVariants](v13, "textVariants");
  v7 = -[CPSBannerItem detailTextVariants](v13, "detailTextVariants");
  v6 = -[CPSBannerItem imageSet](v13, "imageSet");
  v5 = -[CPSBannerItem identifier](v13, "identifier");
  v4 = -[CPSBannerItem bundleIdentifier](v13, "bundleIdentifier");
  v10 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<textVariants: %@, detailTextVariants: %@, imageSet: %@, identifier: %@, bundleID: %@>"), v9, v8, v7, v6, v5, v4);

  return v10;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)textVariants
{
  return self->_textVariants;
}

- (NSArray)detailTextVariants
{
  return self->_detailTextVariants;
}

- (NSArray)attributedDetailTextVariants
{
  return self->_attributedDetailTextVariants;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (BOOL)isManeuverItem
{
  return self->_isManeuverItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_attributedDetailTextVariants, 0);
  objc_storeStrong((id *)&self->_detailTextVariants, 0);
  objc_storeStrong((id *)&self->_textVariants, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
