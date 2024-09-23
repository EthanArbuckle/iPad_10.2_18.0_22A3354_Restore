@implementation WFLocationContentItem

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
    v7[2] = __57__WFLocationContentItem_ChooseFromList__getListSubtitle___block_invoke;
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
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(id, void *))a3;
  -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v4 && v7)
    v4[2](v4, v6);

  return v8 != 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__WFLocationContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_24C4E0020;
    v11 = v7;
    -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:completionHandler:](self, "getMKMapSnapshotImageForSize:scale:completionHandler:", v10, width, height, 1.0);

  }
  return 1;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

uint64_t __66__WFLocationContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__WFLocationContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "addressString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v33;
  void *v34;
  _QWORD v35[13];

  v35[11] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Latitude"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_117, v34, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  WFLocalizedContentPropertyNameMarker(CFSTR("Longitude"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_123_21419, v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v31;
  WFLocalizedContentPropertyNameMarker(CFSTR("Altitude"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_126_21422, v30, objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v29;
  WFLocalizedContentPropertyNameMarker(CFSTR("Street"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userInfo:", CFSTR("street"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  WFLocalizedContentPropertyNameMarker(CFSTR("City"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, v25, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userInfo:", CFSTR("city"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v23;
  WFLocalizedContentPropertyNameMarker(CFSTR("State"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, v22, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userInfo:", CFSTR("state"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v20;
  WFLocalizedContentPropertyNameMarker(CFSTR("ZIP Code"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "userInfo:", CFSTR("postalCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v17;
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, CFSTR("Country"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo:", CFSTR("country"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Region"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayName:", v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v2;
  WFLocalizedContentPropertyNameMarker(CFSTR("Phone Number"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_152_21436, v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v4;
  WFLocalizedContentPropertyNameMarker(CFSTR("Label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_21415, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo:", CFSTR("localizedLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentProperty possibleLabelsForClass:localized:](WFContentProperty, "possibleLabelsForClass:localized:", objc_opt_class(), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleValues:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v9;
  WFLocalizedContentPropertyNameMarker(CFSTR("URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_162_21442, v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  WFLocalizedString(CFSTR("Full Street Address"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior coercingToStringWithDescription:](WFContentItemStringConversionBehavior, "coercingToStringWithDescription:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLPlacemark"), CFSTR("CoreLocation"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLLocation"), CFSTR("CoreLocation"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MKMapItem"), CFSTR("MapKit"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  return WFDeferrableLocalizedStringWithKey(CFSTR("Location (singular)"), CFSTR("Location"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Locations"), CFSTR("Locations"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Locations"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_12;
  v8[3] = &unk_24C4E2B18;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, getMKMapItemClass_21444());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "url");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_10;
  v8[3] = &unk_24C4E2B18;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, getMKMapItemClass_21444());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "phoneNumber");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[WFPhoneNumber phoneNumberWithPhoneNumberString:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_8;
  v8[3] = &unk_24C4E2A90;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, getCLLocationClass_21474());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "altitude");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_6;
  v8[3] = &unk_24C4E2A90;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, getCLLocationClass_21474());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%0.16g"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_24C4E2A90;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, getCLLocationClass_21474());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%0.16g"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_24C4E2A48;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v7;
  v10 = a2;
  objc_msgSend(v10, "getObjectRepresentation:forClass:", v11, objc_opt_class());

}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (CLPlacemark)placemark
{
  return (CLPlacemark *)-[WFContentItem objectForClass:](self, "objectForClass:", getCLPlacemarkClass());
}

- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 named:(id)a5 withCompletionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_named_withCompletionHandler___block_invoke;
  v15[3] = &unk_24C4E2990;
  v16 = v11;
  v17 = v12;
  v13 = v11;
  v14 = v12;
  -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:completionHandler:](self, "getMKMapSnapshotImageForSize:scale:completionHandler:", v15, width, height, a4);

}

- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;
  double v15;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke;
  v11[3] = &unk_24C4E29E0;
  v13 = width;
  v14 = height;
  v15 = a4;
  v12 = v9;
  v10 = v9;
  -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v11, getCLLocationClass_21474());

}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v43[3] = &unk_24C4E2A90;
    v44 = v8;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v43, getCLLocationClass_21474());
    v12 = v44;
  }
  else
  {
    NSStringFromClass(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(CFSTR("CLLocation"), "isEqualToString:", v10);

    if (!v11)
    {
      NSStringFromClass(a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(CFSTR("CLPlacemark"), "isEqualToString:", v13);

      if (v14)
      {
        -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "conformsToClass:", objc_opt_class()))
        {
          -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
          v16 = (id)objc_claimAutoreleasedReturnValue();
          getCLGeocoderClass();
          v17 = (void *)objc_opt_new();
          objc_msgSend(v16, "addressString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
          v39[3] = &unk_24C4E33B0;
          v19 = &v40;
          v40 = v8;
          objc_msgSend(v17, "geocodeAddressString:completionHandler:", v18, v39);

        }
        else
        {
          -[WFContentItem objectForClass:](self, "objectForClass:", getCLLocationClass_21474());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
          v36[3] = &unk_24C4E2A48;
          v19 = &v38;
          v37 = v22;
          v38 = v8;
          v16 = v22;
          -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v36, objc_opt_class());
          v17 = v37;
        }

      }
      else
      {
        if ((Class)objc_opt_class() == a5)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
          v34[3] = &unk_24C4E2B88;
          v35 = v8;
          -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v34, objc_opt_class());
          v12 = v35;
          goto LABEL_5;
        }
        NSStringFromClass(a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(CFSTR("MKMapItem"), "isEqualToString:", v20);

        if (v21)
        {
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
          v32[3] = &unk_24C4E2B88;
          v33 = v8;
          -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v32, objc_opt_class());
          v12 = v33;
          goto LABEL_5;
        }
        if ((Class)objc_opt_class() != a5)
        {
          if ((Class)objc_opt_class() != a5)
          {
            objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v23);

            goto LABEL_6;
          }
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_10;
          v26[3] = &unk_24C4E2A48;
          v28 = v8;
          v27 = v9;
          -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v26, objc_opt_class());

          v12 = v28;
          goto LABEL_5;
        }
        -[WFContentItem objectForClass:](self, "objectForClass:", getCLPlacemarkClass());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItem objectForClass:](self, "objectForClass:", getCLLocationClass_21474());
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_9;
        v29[3] = &unk_24C4E2BD8;
        v30 = v24;
        v31 = v8;
        v25 = v24;
        +[DCMapsLink createMapsLinkWithPlacemark:location:streetAddress:shiftingLocationIfNecessary:completionHandler:](DCMapsLink, "createMapsLinkWithPlacemark:location:streetAddress:shiftingLocationIfNecessary:completionHandler:", v15, v16, v25, 1, v29);

      }
      goto LABEL_6;
    }
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v41[3] = &unk_24C4E2B60;
    v42 = v8;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v41, getCLPlacemarkClass());
    v12 = v42;
  }
LABEL_5:

LABEL_6:
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a5;
  v7 = *MEMORY[0x24BDF84F8];
  v8 = a3;
  if (objc_msgSend(v21, "conformsToUTType:", v7))
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screenScale");
    v11 = v10;

    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screenBounds");
    v14 = v13;

    if (v14 > 500.0)
      v14 = 500.0;
    +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUserInterfaceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("Watch")))
    {
      v14 = 250.0;
      v11 = 2.0;
    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Map of %@"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:named:withCompletionHandler:](self, "getMKMapSnapshotImageForSize:scale:named:withCompletionHandler:", v20, v8, v14, v14, v11);
    v8 = (id)v20;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);
  }

}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 1;
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (v3)
  {
    getCLGeocoderClass();
    v4 = (void *)objc_opt_new();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v5[3] = &unk_24C4E33B0;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "reverseGeocodeLocation:completionHandler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v12, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v8, 0, a4);
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v11, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = objc_alloc((Class)getMKPlacemarkClass_21541());
      objc_msgSend(*(id *)(a1 + 32), "coordinate");
      v8 = v7;
      v10 = v9;
      objc_msgSend(v4, "postalAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "initWithCoordinate:postalAddress:", v11, v8, v10);

    }
    v12 = *(_QWORD *)(a1 + 40);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v14, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "addressString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v11, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v8, 0, a4);
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v10 = (void *)getMKLocalSearchRequestClass_softClass_21533;
    v28 = getMKLocalSearchRequestClass_softClass_21533;
    v11 = MEMORY[0x24BDAC760];
    if (!getMKLocalSearchRequestClass_softClass_21533)
    {
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getMKLocalSearchRequestClass_block_invoke_21534;
      v23 = &unk_24C4E3118;
      v24 = &v25;
      __getMKLocalSearchRequestClass_block_invoke_21534((uint64_t)&v20);
      v10 = (void *)v26[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v25, 8);
    v13 = objc_alloc_init(v12);
    objc_msgSend(v7, "addressString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNaturalLanguageQuery:", v14);

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v15 = (void *)getMKLocalSearchClass_softClass_21535;
    v28 = getMKLocalSearchClass_softClass_21535;
    if (!getMKLocalSearchClass_softClass_21535)
    {
      v20 = v11;
      v21 = 3221225472;
      v22 = __getMKLocalSearchClass_block_invoke_21536;
      v23 = &unk_24C4E3118;
      v24 = &v25;
      __getMKLocalSearchClass_block_invoke_21536((uint64_t)&v20);
      v15 = (void *)v26[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v25, 8);
    v17 = (void *)objc_msgSend([v16 alloc], "initWithRequest:", v13);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_8;
    v18[3] = &unk_24C4E2BB0;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v17, "startWithCompletionHandler:", v18);

  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addressString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    WFLocalizedStringWithKey(CFSTR("Location (default location name)"), CFSTR("Location"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Open %@ in Maps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v14, 0);

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "permissionRequestor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_11;
    v5[3] = &unk_24C4E2C28;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "allowContactsAccessWithCompletionHandler:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_12;
    v6[3] = &unk_24C4E2C00;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(a2, "allContactsWithSortOrder:passingTest:", 0, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v5, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

uint64_t __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "streetAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "value", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v9) = objc_msgSend(v9, "isEqual:", v10);

          if ((v9 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "mapItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v5, "mapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v13, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFStreetAddress streetAddressWithPlacemark:label:](WFStreetAddress, "streetAddressWithPlacemark:label:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v11, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v10 = (void *)getMKMapSnapshotOptionsClass_softClass;
  v43 = getMKMapSnapshotOptionsClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getMKMapSnapshotOptionsClass_softClass)
  {
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = (uint64_t)__getMKMapSnapshotOptionsClass_block_invoke;
    v38 = &unk_24C4E3118;
    v39 = &v40;
    __getMKMapSnapshotOptionsClass_block_invoke((uint64_t)&v35);
    v10 = (void *)v41[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v40, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v7, "coordinate");
  v15 = v14;
  v17 = v16;
  v35 = 0;
  v36 = (uint64_t)&v35;
  v37 = 0x2020000000;
  v18 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  v38 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    v19 = MapKitLibrary_21447();
    v18 = dlsym(v19, "MKCoordinateRegionMakeWithDistance");
    *(_QWORD *)(v36 + 24) = v18;
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(&v35, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MKCoordinateRegion WFMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("WFLocationContentItem.m"), 42, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(double, double, double, double))v18)(v15, v17, 1500.0, 1500.0);
  objc_msgSend(v13, "setRegion:");
  objc_msgSend(v13, "setSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v13, "setScale:", *(double *)(a1 + 56));
  v20 = objc_alloc((Class)getMKMapItemClass_21444());
  v21 = objc_alloc((Class)getMKPlacemarkClass_21541());
  objc_msgSend(v7, "coordinate");
  v22 = (void *)objc_msgSend(v21, "initWithCoordinate:");
  v23 = (void *)objc_msgSend(v20, "initWithPlacemark:", v22);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v24 = (void *)getMKMapSnapshotCustomFeatureAnnotationClass_softClass;
  v43 = getMKMapSnapshotCustomFeatureAnnotationClass_softClass;
  if (!getMKMapSnapshotCustomFeatureAnnotationClass_softClass)
  {
    v35 = v11;
    v36 = 3221225472;
    v37 = (uint64_t)__getMKMapSnapshotCustomFeatureAnnotationClass_block_invoke;
    v38 = &unk_24C4E3118;
    v39 = &v40;
    __getMKMapSnapshotCustomFeatureAnnotationClass_block_invoke((uint64_t)&v35);
    v24 = (void *)v41[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v25, "customFeatureAnnotationForMapItem:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setCustomFeatureAnnotations:", v27);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v28 = (void *)getMKMapSnapshotterClass_softClass;
  v43 = getMKMapSnapshotterClass_softClass;
  if (!getMKMapSnapshotterClass_softClass)
  {
    v35 = v11;
    v36 = 3221225472;
    v37 = (uint64_t)__getMKMapSnapshotterClass_block_invoke;
    v38 = &unk_24C4E3118;
    v39 = &v40;
    __getMKMapSnapshotterClass_block_invoke((uint64_t)&v35);
    v28 = (void *)v41[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v40, 8);
  v30 = (void *)objc_msgSend([v29 alloc], "initWithOptions:", v13);
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke_2;
  v33[3] = &unk_24C4E29B8;
  v34 = *(id *)(a1 + 32);
  objc_msgSend(v30, "startWithCompletionHandler:", v33);

}

void __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, id);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = (objc_class *)MEMORY[0x24BEC14E0];
    v6 = a3;
    v7 = [v5 alloc];
    objc_msgSend(v12, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithPlatformImage:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, id))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void __88__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_named_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD);
  id v10;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v6 = a3;
    objc_msgSend(a2, "PNGRepresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v10, v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v10 = a3;
    v9(v3, 0);
  }

}

@end
