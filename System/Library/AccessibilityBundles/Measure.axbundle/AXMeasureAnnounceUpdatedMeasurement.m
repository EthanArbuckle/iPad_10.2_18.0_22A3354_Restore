@implementation AXMeasureAnnounceUpdatedMeasurement

void __AXMeasureAnnounceUpdatedMeasurement_block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  AXMeasureAccessibilityStateObserver();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axHasConfirmedRectangle");

  if (!*(_BYTE *)(a1 + 48) && (v3 & 1) == 0)
  {
    AXMeasureAccessibilityStateObserver();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axDescriptionForNumberOfPointsAndLines");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    if (v7)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v7);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v6;
      }
    }
    else
    {
      v5 = *(id *)(a1 + 32);
    }
    v8 = v5;
    AXMeasureSpeakMeasurementAnnouncement(v5);

  }
}

@end
