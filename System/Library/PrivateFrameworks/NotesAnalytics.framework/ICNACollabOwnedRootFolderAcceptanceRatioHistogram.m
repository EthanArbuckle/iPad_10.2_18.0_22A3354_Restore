@implementation ICNACollabOwnedRootFolderAcceptanceRatioHistogram

- (void)setup
{
  -[ICNAHistogramBase setBucketLeftBounds:](self, "setBucketLeftBounds:", &unk_1E7750998);
  -[ICNAHistogramBase setValuePrecision:](self, "setValuePrecision:", 0.01);
  -[ICNAHistogramBase setValueMax:](self, "setValueMax:", &unk_1E7749818);
}

@end
