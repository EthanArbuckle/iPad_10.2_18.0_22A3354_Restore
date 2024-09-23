@implementation SearchUIScoreSummaryCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIScoreSummaryCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUIScoreSummaryCardSectionView"), CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("section"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFScoreboardCardSection"), CFSTR("team1"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFScoreboardCardSection"), CFSTR("team2"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFScoreboardCardSection"), CFSTR("subtitle"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFScoreboardCardSection"), CFSTR("accessibilityDescription"));
  objc_msgSend(v3, "validateClass:", CFSTR("SFSportsTeam"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFSportsTeam"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFSportsTeam"), CFSTR("record"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
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

  -[SearchUIScoreSummaryCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("accessibilityDescription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("team1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("team2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("record"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("record"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (v10 && v9)
  {
    -[SearchUIScoreSummaryCardSectionViewAccessibility _axRecordStringWithLeftTeamName:score:rightTeamName:score:](self, "_axRecordStringWithLeftTeamName:score:rightTeamName:score:", v7, v9, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __AXStringForVariables();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_axRecordStringWithLeftTeamName:(id)a3 score:(id)a4 rightTeamName:(id)a5 score:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("-"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") == 3 && objc_msgSend(v13, "count") == 3)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.wins"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v15, objc_msgSend(v16, "integerValue"));
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.draws"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, objc_msgSend(v20, "integerValue"));
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.losses"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v23, objc_msgSend(v24, "integerValue"));
    v60 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v21;
    v63 = (void *)v17;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@, %@"), v17, v21, v60);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.wins"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v27, objc_msgSend(v28, "integerValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.draws"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringWithFormat:", v31, objc_msgSend(v33, "integerValue"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.losses"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringWithFormat:", v36, objc_msgSend(v37, "integerValue"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@, %@"), v29, v34, v38);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)v60;
    v9 = v32;
  }
  else
  {
    if (objc_msgSend(v12, "count") != 2 || objc_msgSend(v13, "count") != 2)
    {
      v39 = 0;
      goto LABEL_9;
    }
    v61 = v9;
    v41 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.wins"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringWithFormat:", v42, objc_msgSend(v43, "integerValue"));
    v44 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.losses"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringWithFormat:", v46, objc_msgSend(v47, "integerValue"));
    v48 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v48;
    v63 = (void *)v44;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v44, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.wins"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringWithFormat:", v51, objc_msgSend(v52, "integerValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("score.losses"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v55, "integerValue");
    v56 = v53;
    v9 = v61;
    objc_msgSend(v56, "localizedStringWithFormat:", v54, v58);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)v49;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v25, v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v39;
}

@end
