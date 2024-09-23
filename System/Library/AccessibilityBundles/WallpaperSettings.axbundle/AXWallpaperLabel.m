@implementation AXWallpaperLabel

void __AXWallpaperLabel_block_invoke()
{
  id v0;
  const __CFString *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x24BDBCE70]);
  if (AXDeviceIsPad())
    v1 = CFSTR("DarkBlueToLightGreenGradient");
  else
    v1 = CFSTR("GeodesicHexagons");
  v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("100"), CFSTR("ColoredWave"), CFSTR("100.CB_Wave"), CFSTR("NebulaStars"), CFSTR("101"), CFSTR("EarthHorizon"), CFSTR("102"), CFSTR("NorthernLights"), CFSTR("103"), CFSTR("SnowyMountains"), CFSTR("104"), CFSTR("WinterLake"), CFSTR("105"), CFSTR("CloseUpWater"), CFSTR("106"), CFSTR("SunsetHillsVista"), CFSTR("107"),
         CFSTR("BlackAndWhiteLakeAndHills"),
         CFSTR("108"),
         CFSTR("GoldenGrassHills"),
         CFSTR("109"),
         CFSTR("OceanWaterOnBeach"),
         CFSTR("110"),
         CFSTR("CrashingWave"),
         CFSTR("111"),
         CFSTR("FrothyWave"),
         CFSTR("112"),
         CFSTR("WaterLilly"),
         CFSTR("113"),
         CFSTR("GoldenPoppyFlowers"),
         CFSTR("114"),
         CFSTR("FlowerBallsOnLongStalks"),
         CFSTR("115"),
         CFSTR("CloseUpGrass"),
         CFSTR("116"),
         CFSTR("CloseUpDewDrops"),
         CFSTR("117"),
         CFSTR("CloseUpBladeGrass"),
         CFSTR("118"),
         CFSTR("LightYellowToGreenishGradient"),
         CFSTR("120"),
         CFSTR("LightToDarkBlueGradient"),
         CFSTR("121"),
         v1,
         CFSTR("122"),
         CFSTR("WoodCirclesInShingleFashion"),
         CFSTR("123"),
         CFSTR("FlecksOfColors"),
         CFSTR("124"),
         CFSTR("OverlappingSquares"),
         CFSTR("125"),
         CFSTR("ColoredOverlappingPatterns1"),
         CFSTR("126"),
         CFSTR("ColoredOverlappingPatterns2"),
         CFSTR("127"),
         CFSTR("GeodesicHexagons"),
         CFSTR("128"),
         CFSTR("RedDots"),
         CFSTR("200"),
         CFSTR("BrightYellowDots"),
         CFSTR("201"));
  v3 = (void *)AXWallpaperLabel_ImageMapping;
  AXWallpaperLabel_ImageMapping = v2;

}

@end
