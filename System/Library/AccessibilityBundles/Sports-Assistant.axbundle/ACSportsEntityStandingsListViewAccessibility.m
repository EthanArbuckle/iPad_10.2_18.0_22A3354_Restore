@implementation ACSportsEntityStandingsListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsEntityStandingsListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsEntityStandingsListView"), CFSTR("configureDomainObjectView: withDomainObject: beforeDomainObject: afterDomainObject: league: index:"), "v", "@", "@", "@", "@", "@", "Q", 0);
}

- (void)configureDomainObjectView:(id)a3 withDomainObject:(id)a4 beforeDomainObject:(id)a5 afterDomainObject:(id)a6 league:(id)a7 index:(unint64_t)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACSportsEntityStandingsListViewAccessibility;
  -[ACSportsEntityStandingsListViewAccessibility configureDomainObjectView:withDomainObject:beforeDomainObject:afterDomainObject:league:index:](&v9, sel_configureDomainObjectView_withDomainObject_beforeDomainObject_afterDomainObject_league_index_, a3, a4, a5, a6, a7, a8);
  -[ACSportsEntityStandingsListViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXStandingsElements"));
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  -[ACSportsEntityStandingsListViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXStandingsElements"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSportsEntityStandingsListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("snippetColumns"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSportsEntityStandingsListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("domainObjectViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __69__ACSportsEntityStandingsListViewAccessibility_accessibilityElements__block_invoke;
    v13 = &unk_250361F18;
    v14 = v5;
    v7 = v4;
    v15 = v7;
    v8 = v5;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, &v10);
    v3 = v7;
    -[ACSportsEntityStandingsListViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXStandingsElements"), v10, v11, v12, v13);

  }
  return v3;
}

void __69__ACSportsEntityStandingsListViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXStandingsColumns"));
  objc_msgSend(*(id *)(a1 + 40), "ax_enqueueObject:", v4);

}

@end
