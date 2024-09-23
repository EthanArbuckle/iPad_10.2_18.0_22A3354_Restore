@implementation GEOFactoid(MUAmenityItemViewModel)

- (uint64_t)isApplePay
{
  return 0;
}

- (id)symbolImageForFont:()MUAmenityItemViewModel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4
    || (v5 = (void *)MEMORY[0x1E0DC3870],
        objc_msgSend(a1, "symbolName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v6, v2),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:withConfiguration:", CFSTR("checkmark"), v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
