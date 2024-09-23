@implementation WFMKMapItemContentItem

- (MKMapItem)mapItem
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getMKMapItemClass_softClass;
  v10 = getMKMapItemClass_softClass;
  if (!getMKMapItemClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getMKMapItemClass_block_invoke;
    v6[3] = &unk_24C4E3118;
    v6[4] = &v7;
    __getMKMapItemClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  -[WFContentItem objectForClass:](self, "objectForClass:", v4);
  return (MKMapItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v7)(id, void *, id);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  void (**v40)(id, void *, id);
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, id))a3;
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() == a5)
    {
      -[WFMKMapItemContentItem mapItem](self, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v12;
      v13 = (void *)MEMORY[0x24BDBCE30];
      v14 = (void **)v44;
      goto LABEL_8;
    }
    if ((Class)objc_opt_class() == a5)
    {
      -[WFMKMapItemContentItem mapItem](self, "mapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "phoneNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      +[WFPhoneNumber phoneNumbersInString:error:](WFPhoneNumber, "phoneNumbersInString:error:", v19, &v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v38;

      +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v22, v21);

    }
    else
    {
      NSStringFromClass(a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(CFSTR("CLPlacemark"), "isEqualToString:", v8);

      if (v9)
      {
        -[WFMKMapItemContentItem mapItem](self, "mapItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placemark");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v12;
        v13 = (void *)MEMORY[0x24BDBCE30];
        v14 = &v43;
LABEL_8:
        objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v17, 0);

LABEL_9:
        goto LABEL_17;
      }
      if ((Class)objc_opt_class() != a5)
      {
        if ((Class)objc_opt_class() != a5)
        {
          objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v10);
          goto LABEL_9;
        }
        -[WFMKMapItemContentItem mapItem](self, "mapItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "placemark");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFStreetAddress streetAddressWithPlacemark:label:](WFStreetAddress, "streetAddressWithPlacemark:label:", v28, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "addressString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFMKMapItemContentItem mapItem](self, "mapItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31
          && (objc_msgSend(v20, "street"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              v33 = objc_msgSend(v32, "isEqualToString:", v31),
              v32,
              (v33 & 1) == 0))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v31, v29);
          v34 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = v29;
        }
        v35 = v34;
        +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v34, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v37, 0);

LABEL_16:
        goto LABEL_17;
      }
      -[WFMKMapItemContentItem mapItem](self, "mapItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "placemark");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFStreetAddress streetAddressWithPlacemark:label:](WFStreetAddress, "streetAddressWithPlacemark:label:", v24, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFContentItem name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v20, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v26, 0);

    }
    goto LABEL_16;
  }
  -[WFMKMapItemContentItem mapItem](self, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "placemark");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __73__WFMKMapItemContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v39[3] = &unk_24C4E2BD8;
  v39[4] = self;
  v40 = v7;
  +[DCMapsLink createMapsLinkWithPlacemark:location:streetAddress:shiftingLocationIfNecessary:completionHandler:](DCMapsLink, "createMapsLinkWithPlacemark:location:streetAddress:shiftingLocationIfNecessary:completionHandler:", v16, 0, 0, 0, v39);

LABEL_17:
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFMKMapItemContentItem mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

LABEL_9:
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFMKMapItemContentItem mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[WFMKMapItemContentItem mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phoneNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[WFPhoneNumber stringContainsPhoneNumbers:](WFPhoneNumber, "stringContainsPhoneNumbers:", v10);

    }
    else
    {
      v7 = 0;
    }

    goto LABEL_9;
  }
  v12.receiver = self;
  v12.super_class = (Class)WFMKMapItemContentItem;
  v7 = -[WFContentItem canGenerateRepresentationForType:](&v12, sel_canGenerateRepresentationForType_, v4);
LABEL_10:

  return v7;
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

- (CLLocation)queryLocation
{
  return self->_queryLocation;
}

- (void)setQueryLocation:(id)a3
{
  objc_storeStrong((id *)&self->_queryLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLocation, 0);
}

void __73__WFMKMapItemContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Open %@ in Maps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v11, 0);

}

+ (id)itemWithMapItem:(id)a3 fromQueryLocation:(id)a4 origin:(id)a5 disclosureLevel:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a4;
  objc_msgSend(a1, "itemWithObject:origin:disclosureLevel:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueryLocation:", v10);

  return v11;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFMKMapItemContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MKMapItem"), CFSTR("MapKit"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLPlacemark"), CFSTR("CoreLocation"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Place"), CFSTR("Place"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Places"), CFSTR("Places"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Places"));
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__WFMKMapItemContentItem_ChooseFromList__getListSubtitle___block_invoke;
    v7[3] = &unk_24C4E2B88;
    v8 = v4;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v7, objc_opt_class());

  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (void (**)(id, void *))a3;
  -[WFMKMapItemContentItem queryLocation](self, "queryLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFMKMapItemContentItem mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placemark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v9 = (void *)getMKDistanceFormatterClass_softClass;
    v19 = getMKDistanceFormatterClass_softClass;
    if (!getMKDistanceFormatterClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getMKDistanceFormatterClass_block_invoke;
      v15[3] = &unk_24C4E3118;
      v15[4] = &v16;
      __getMKDistanceFormatterClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v16, 8);
    v11 = objc_alloc_init(v10);
    objc_msgSend(v11, "setUnitStyle:", 1);
    if (v4)
    {
      -[WFMKMapItemContentItem queryLocation](self, "queryLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "distanceFromLocation:", v8);
      objc_msgSend(v11, "stringFromDistance:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13);

    }
  }

  return v5 != 0;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

void __58__WFMKMapItemContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "shortAddressString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
