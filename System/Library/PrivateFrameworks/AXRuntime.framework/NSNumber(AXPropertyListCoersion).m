@implementation NSNumber(AXPropertyListCoersion)

- (uint64_t)_axDictionaryKeyReplacementRepresentation
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lld"), CFSTR("_AXSNSNumber"), objc_msgSend(a1, "longLongValue"));
}

- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  return 0;
}

@end
