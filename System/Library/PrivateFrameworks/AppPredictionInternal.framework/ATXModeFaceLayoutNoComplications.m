@implementation ATXModeFaceLayoutNoComplications

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  objc_msgSend(a4, "setLayoutType:", 0);
  return 1;
}

@end
