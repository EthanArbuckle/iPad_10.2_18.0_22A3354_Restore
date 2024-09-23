@implementation HKAudiogramAverageSensitivityDataSource

- (HKAudiogramAverageSensitivityDataSource)initWithAudiogramSample:(id)a3 isLeftEar:(BOOL)a4
{
  id v7;
  id v8;
  HKAudiogramAverageSensitivityDataSource *v9;
  id v10;
  void *v11;
  HKAudiogramAverageSensitivityDataSource *v12;
  objc_super v14;

  v7 = objc_allocWithZone((Class)HKGraphSeriesDataBlock);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v7, sel_init);
  sub_1D7B098B0(v8, a4);
  sub_1D7ADE914(0, (unint64_t *)&qword_1F014DF40);
  v11 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setChartPoints_, v11);

  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR___HKAudiogramAverageSensitivityDataSource_dataBlock) = (Class)v10;
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AudiogramAverageSensitivityDataSource();
  v12 = -[HKGraphSeriesDataSource init](&v14, sel_init);

  return v12;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  HKAudiogramAverageSensitivityDataSource *v8;
  HKGraphSeriesDataBlockPath *result;
  uint64_t v10;

  swift_unknownObjectRetain();
  v8 = self;
  sub_1D7B4A770();

  swift_unknownObjectRelease();
  result = (HKGraphSeriesDataBlockPath *)__swift_destroy_boxed_opaque_existential_0((uint64_t)&v10);
  *(_OWORD *)&retstr->index = xmmword_1D7B85DE0;
  retstr->resolution = 0;
  return result;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t index;
  HKAudiogramAverageSensitivityDataSource *v6;
  id v7;
  HKAudiogramAverageSensitivityDataSource *v8;
  void *v9;
  _OWORD v11[2];

  index = a3->index;
  if (!a4)
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
    if (index)
      goto LABEL_3;
LABEL_5:
    v7 = objc_retain(*(id *)((char *)&self->super.super.isa
                           + OBJC_IVAR___HKAudiogramAverageSensitivityDataSource_dataBlock));
    goto LABEL_6;
  }
  v6 = self;
  swift_unknownObjectRetain();
  sub_1D7B4A770();
  swift_unknownObjectRelease();
  if (!index)
    goto LABEL_5;
LABEL_3:
  v7 = objc_msgSend((id)objc_opt_self(), sel_emptyDataBlock);
LABEL_6:
  v9 = v7;

  sub_1D7AB1290((uint64_t)v11);
  return v9;
}

- (HKAudiogramAverageSensitivityDataSource)init
{
  HKAudiogramAverageSensitivityDataSource *result;

  result = (HKAudiogramAverageSensitivityDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
