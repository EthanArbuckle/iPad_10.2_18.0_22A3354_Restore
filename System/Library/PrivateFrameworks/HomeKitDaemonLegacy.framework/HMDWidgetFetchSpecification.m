@implementation HMDWidgetFetchSpecification

- (HMDWidgetFetchSpecification)initWithName:(id)a3 serviceTypes:(id)a4 associatedServiceTypes:(id)a5 characteristicTypes:(id)a6 affectedWidgetKinds:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDWidgetFetchSpecification *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSSet *serviceTypes;
  uint64_t v21;
  NSSet *associatedServiceTypes;
  uint64_t v23;
  NSSet *characteristicTypes;
  uint64_t v25;
  NSSet *affectedWidgetKinds;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HMDWidgetFetchSpecification;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[HMDWidgetFetchSpecification init](&v28, sel_init);
  v17 = objc_msgSend(v15, "copy", v28.receiver, v28.super_class);

  name = v16->_name;
  v16->_name = (NSString *)v17;

  v19 = objc_msgSend(v14, "copy");
  serviceTypes = v16->_serviceTypes;
  v16->_serviceTypes = (NSSet *)v19;

  v21 = objc_msgSend(v13, "copy");
  associatedServiceTypes = v16->_associatedServiceTypes;
  v16->_associatedServiceTypes = (NSSet *)v21;

  v23 = objc_msgSend(v12, "copy");
  characteristicTypes = v16->_characteristicTypes;
  v16->_characteristicTypes = (NSSet *)v23;

  v25 = objc_msgSend(v11, "copy");
  affectedWidgetKinds = v16->_affectedWidgetKinds;
  v16->_affectedWidgetKinds = (NSSet *)v25;

  return v16;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWidgetFetchSpecification serviceTypes](self, "serviceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Service Types"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWidgetFetchSpecification associatedServiceTypes](self, "associatedServiceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Associated Service Types"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWidgetFetchSpecification characteristicTypes](self, "characteristicTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Characteristic Types"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWidgetFetchSpecification affectedWidgetKinds](self, "affectedWidgetKinds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Affected Widget Kinds"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)serviceTypes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)associatedServiceTypes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)characteristicTypes
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)affectedWidgetKinds
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedWidgetKinds, 0);
  objc_storeStrong((id *)&self->_characteristicTypes, 0);
  objc_storeStrong((id *)&self->_associatedServiceTypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (NSSet)allHomeLockScreenWidgetKinds
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("com.apple.Home.widget.summary.category");
  v6[1] = CFSTR("com.apple.Home.widget.lights.category");
  v6[2] = CFSTR("com.apple.Home.widget.security.category");
  v6[3] = CFSTR("com.apple.Home.widget.security.singleAccessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)lightsFetchSpecifications
{
  void *v2;
  void *v3;
  void *v4;
  HMDWidgetFetchSpecification *v5;
  uint64_t v6;
  uint64_t v7;
  HMDWidgetFetchSpecification *v8;
  HMDWidgetFetchSpecification *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDWidgetFetchSpecification *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = CFSTR("com.apple.Home.widget.lights.category");
  v26[1] = CFSTR("com.apple.Home.widget.summary.category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99E60];
  v5 = [HMDWidgetFetchSpecification alloc];
  v6 = *MEMORY[0x1E0CB9A70];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A70]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB89C8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB89C8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v5, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Lightbulbs"), v23, v22, v20, v4);
  v25[0] = v8;
  v9 = [HMDWidgetFetchSpecification alloc];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = *MEMORY[0x1E0CB9AD8];
  v24[0] = *MEMORY[0x1E0CB9AA0];
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v9, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Outlets & Switches w/ associated Lightbulbs"), v13, v14, v15, v4);
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v18;
}

+ (NSSet)mainHomeSecurityFetchSpecifications
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDWidgetFetchSpecification *v7;
  uint64_t v8;
  HMDWidgetFetchSpecification *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  HMDWidgetFetchSpecification *v13;
  void *v14;
  HMDWidgetFetchSpecification *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDWidgetFetchSpecification *v19;
  HMDWidgetFetchSpecification *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDWidgetFetchSpecification *v24;
  void *v25;
  HMDWidgetFetchSpecification *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDWidgetFetchSpecification *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  HMDWidgetFetchSpecification *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[2];
  _QWORD v46[5];
  _QWORD v47[3];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v48[0] = CFSTR("com.apple.Home.widget.security.category");
  v48[1] = CFSTR("com.apple.Home.widget.summary.category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E60];
  v47[0] = CFSTR("com.apple.Home.widget.security.category");
  v47[1] = CFSTR("com.apple.Home.widget.summary.category");
  v47[2] = CFSTR("com.apple.Home.widget.security.singleAccessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (id)MEMORY[0x1E0C99E60];
  v7 = [HMDWidgetFetchSpecification alloc];
  v8 = *MEMORY[0x1E0CB9A28];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A28]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8838]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v7, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Garage Door Openers"), v43, v42, v41, v6);
  v46[0] = v40;
  v9 = [HMDWidgetFetchSpecification alloc];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v12 = *MEMORY[0x1E0CB9B28];
  v45[0] = *MEMORY[0x1E0CB9A00];
  v11 = v45[0];
  v45[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB89B8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v9, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Motorized Doors & Windows"), v35, v34, v33, v38);
  v46[1] = v32;
  v13 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99F0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = v8;
  v44[1] = v11;
  v44[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8820]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v13, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Contact Sensors w/ associated Garage Doors, Doors, or Windows"), v30, v29, v28, v6);
  v46[2] = v27;
  v15 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8868]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v15, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Locks"), v16, v17, v18, v6);
  v46[3] = v19;
  v20 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AA8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8888]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v20, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Security Systems"), v21, v22, v23, v6);
  v46[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v25);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v37;
}

+ (NSSet)allOtherHomesSingleAccessorySecurityFetchSpecifications
{
  void *v2;
  HMDWidgetFetchSpecification *v3;
  HMDWidgetFetchSpecification *v4;
  void *v5;
  void *v6;
  HMDWidgetFetchSpecification *v7;
  HMDWidgetFetchSpecification *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDWidgetFetchSpecification *v12;
  void *v13;
  void *v14;
  void *v16;
  HMDWidgetFetchSpecification *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.Home.widget.security.singleAccessory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E60];
  v3 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A28]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8838]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v3, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Garage Door Openers"), v21, v20, v19, v2);
  v22[0] = v17;
  v4 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8868]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v4, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Locks"), v16, v5, v6, v2);
  v22[1] = v7;
  v8 = [HMDWidgetFetchSpecification alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8888]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDWidgetFetchSpecification initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:](v8, "initWithName:serviceTypes:associatedServiceTypes:characteristicTypes:affectedWidgetKinds:", CFSTR("Security Systems"), v9, v10, v11, v2);
  v22[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v14;
}

@end
