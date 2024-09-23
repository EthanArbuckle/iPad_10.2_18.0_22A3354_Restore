@implementation PSSpecifier(ACUIGroupSpecifier)

+ (id)groupSpecifierWithFooterLinkButton:()ACUIGroupSpecifier
{
  objc_class *v3;
  id v5;
  NSString *v6;
  id v7;
  id v8;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v8 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v5 = v8;
  v3 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v3);
  objc_msgSend(v5, "setProperty:forKey:");

  objc_msgSend(v8, "setProperty:forKey:", location[0], CFSTR("ACUILinkButtonHolder"));
  v7 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButton:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = v12;
  v6 = location[0];
  v13[0] = v10;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (id)objc_msgSend(v7, "groupSpecifierWithHeader:footer:linkButtons:", 0, v6);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)groupSpecifierWithFooterText:()ACUIGroupSpecifier linkButtons:
{
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v9, "groupSpecifierWithHeader:footer:linkButtons:", 0, location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:
{
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v9, "groupSpecifierWithHeader:footer:linkButtons:", location[0], v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)groupSpecifierWithHeader:()ACUIGroupSpecifier footer:linkButtons:
{
  id v5;
  id v6;
  objc_class *v7;
  id v9;
  NSString *v10;
  id v13;
  id v14;
  id v15;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  if (location[0])
    v5 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", location[0]);
  else
    v5 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v6 = v13;
  v13 = v5;

  v7 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v7);
  objc_msgSend(v13, "setProperty:forKey:");

  objc_msgSend(v13, "setProperty:forKey:", v15, CFSTR("ACUIFooterText"));
  if (v14)
    objc_msgSend(v13, "setProperty:forKey:", v14, CFSTR("ACUILinkButtonArray"));
  v9 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v9;
}

@end
