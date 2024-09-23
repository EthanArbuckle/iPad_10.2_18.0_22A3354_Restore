@implementation AudiogramAverageSensitivityChartPoint

- (id)xValueAsGenericType
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_xCoord));
}

- (id)yValue
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord));
}

- (id)yValueForKey:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord));
}

- (id)allYValues
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  sub_1D7AC2AD8(0, (unint64_t *)&qword_1F014CFC0, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1D7B84630;
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord);
  *(_QWORD *)(v3 + 56) = sub_1D7AAF6EC(0, (unint64_t *)&qword_1F014D240);
  *(_QWORD *)(v3 + 32) = v4;
  v5 = v4;
  v6 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)userInfo
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  objc_class *v6;
  _BYTE *v7;
  _TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint *v8;
  _TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint *v9;
  objc_super v11;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_averageSensitivity);
  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_roundedAverageSensitivity);
  v5 = *((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_isLeftEar);
  v6 = (objc_class *)type metadata accessor for AudiogramAverageSensitivityChartData();
  v7 = objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC8HealthUI36AudiogramAverageSensitivityChartData_averageSensitivity] = v3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8HealthUI36AudiogramAverageSensitivityChartData_roundedAverageSensitivity] = v4;
  v7[OBJC_IVAR____TtC8HealthUI36AudiogramAverageSensitivityChartData_isLeftEar] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = -[AudiogramAverageSensitivityChartPoint init](&v11, sel_init);

  return v9;
}

- (_TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint)init
{
  _TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint *result;

  result = (_TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_xCoord));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord));
}

@end
