@implementation ICNACollabOwnedSingleNoteAcceptanceRatioHistogram

- (void)setup
{
  -[ICNAHistogramBase setBucketLeftBounds:](self, "setBucketLeftBounds:", &unk_1E7750B30);
  -[ICNAHistogramBase setValuePrecision:](self, "setValuePrecision:", 0.01);
  -[ICNAHistogramBase setValueMax:](self, "setValueMax:", &unk_1E774C710);
}

@end
