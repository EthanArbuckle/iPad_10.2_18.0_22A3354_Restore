@implementation CPTextLineSplitter

+ (void)splitLinesIn:(id)a3
{
  CPGuideFinder *v4;
  CPSpacerFinder *v5;

  v4 = -[CPGuideFinder initWithContentZone:]([CPGuideFinder alloc], "initWithContentZone:", a3);
  -[CPGuideFinder findGutters](v4, "findGutters");
  -[CPGuideFinder findGuides](v4, "findGuides");
  objc_msgSend(a3, "setGutters:", -[CPGuideFinder gutters](v4, "gutters"));
  objc_msgSend(a3, "setLeftGuides:", -[CPGuideFinder leftGuides](v4, "leftGuides"));
  objc_msgSend(a3, "setRightGuides:", -[CPGuideFinder rightGuides](v4, "rightGuides"));
  -[CPGuideFinder markTextLines](v4, "markTextLines");
  -[CPGuideFinder dispose](v4, "dispose");

  v5 = -[CPSpacerFinder initWithContentZone:]([CPSpacerFinder alloc], "initWithContentZone:", a3);
  -[CPSpacerFinder findSpacers](v5, "findSpacers");
  objc_msgSend(a3, "setSpacers:", -[CPSpacerFinder spacers](v5, "spacers"));
  -[CPSpacerFinder splitTextLines](v5, "splitTextLines");
  -[CPSpacerFinder dispose](v5, "dispose");

  objc_msgSend(a3, "sortUsingSelector:", sel_compareYDescending_);
}

@end
