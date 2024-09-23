@implementation FTMCellMonitorSharedClass

- (_TtC13FTMInternal_425FTMCellMonitorSharedClass)init
{
  return (_TtC13FTMInternal_425FTMCellMonitorSharedClass *)sub_100188E08();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsGraphArray));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricSheetData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricDetailsClassObject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_queueMetricGraph));
}

@end
