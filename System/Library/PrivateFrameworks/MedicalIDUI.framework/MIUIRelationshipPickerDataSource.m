@implementation MIUIRelationshipPickerDataSource

- (MIUIRelationshipPickerDataSource)initWithContact:(id)a3
{
  MIUIRelationshipPickerDataSource *v3;
  uint64_t v4;
  NSBundle *medicalIDBundle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[11];

  v21[10] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)MIUIRelationshipPickerDataSource;
  v3 = -[MIUIRelationshipPickerDataSource init](&v20, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = objc_claimAutoreleasedReturnValue();
    medicalIDBundle = v3->_medicalIDBundle;
    v3->_medicalIDBundle = (NSBundle *)v4;

    objc_msgSend(MEMORY[0x24BDBAD38], "builtinLabelsForProperty:", *MEMORY[0x24BDBA3C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_roommate"), &stru_25119A000, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v19;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_doctor"), &stru_25119A000, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v18;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_emergency"), &stru_25119A000, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v17;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_family_member"), &stru_25119A000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v8;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_teacher"), &stru_25119A000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v9;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_caretaker"), &stru_25119A000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v10;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_guardian"), &stru_25119A000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v11;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_social_worker"), &stru_25119A000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v12;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_school"), &stru_25119A000, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v13;
    -[NSBundle localizedStringForKey:value:table:](v3->_medicalIDBundle, "localizedStringForKey:value:table:", CFSTR("relationship_daycare"), &stru_25119A000, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[9] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v15);

    -[MIUIRelationshipPickerDataSource setRelationships:](v3, "setRelationships:", v7);
  }
  return v3;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_relationships, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_medicalIDBundle, 0);
}

@end
