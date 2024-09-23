@implementation SiriMoviesChevronButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesChevronButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("primaryString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("secondaryString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("accessoryString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("showtimeListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesShowtimeListView"), CFSTR("showtimes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAMovieShowtime"), CFSTR("showtime"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SACalendar"), CFSTR("date"), "@", 0);

}

- (id)_accessibilityProxyChevronButton
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__SiriMoviesChevronButtonAccessibility__accessibilityProxyChevronButton__block_invoke;
  v5[3] = &unk_2502C09B0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__SiriMoviesChevronButtonAccessibility__accessibilityProxyChevronButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  NSClassFromString(CFSTR("SiriMoviesChevronButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showtimeListView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[SiriMoviesChevronButtonAccessibility _accessibilityProxyChevronButton](self, "_accessibilityProxyChevronButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;

  objc_opt_class();
  -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v5, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC80]);
  objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEB70]);
  -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriMoviesChevronButtonAccessibility _accessibilityProxyChevronButton](self, "_accessibilityProxyChevronButton", v13, v5, CFSTR("__AXStringForVariablesSentinel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "accessibilityLabel");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }

  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  -[SiriMoviesChevronButtonAccessibility _accessibilityProxyChevronButton](self, "_accessibilityProxyChevronButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SiriMoviesChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showtimeListView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("showtimes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke;
      v20[3] = &unk_2502C09D8;
      v21 = v8;
      v11 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);

      objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      v16 = 3221225472;
      v17 = __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_3;
      v18 = &unk_2502C09D8;
      v19 = v7;
      v13 = v7;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "), v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

uint64_t __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("showtime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("showtime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "compare:", v11);
  return v12;
}

void __58__SiriMoviesChevronButtonAccessibility_accessibilityValue__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("showtime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXDateStringForFormat();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

@end
