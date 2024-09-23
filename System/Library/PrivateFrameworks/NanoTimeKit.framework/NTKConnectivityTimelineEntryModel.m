@implementation NTKConnectivityTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  if (a3 == 3 || a3 == 104)
    return -[NTKConnectivityTimelineEntryModel _newUtilitarianLargeTemplate](self, "_newUtilitarianLargeTemplate");
  else
    return 0;
}

- (id)_newUtilitarianLargeTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C94530];
  -[NTKConnectivityTimelineEntryModel connectivity](self, "connectivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalize");

  return v5;
}

- (NSString)connectivity
{
  return self->_connectivity;
}

- (void)setConnectivity:(id)a3
{
  objc_storeStrong((id *)&self->_connectivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivity, 0);
}

@end
