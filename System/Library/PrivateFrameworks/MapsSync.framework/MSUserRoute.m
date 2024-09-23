@implementation MSUserRoute

- (MSUserRoute)initWithAddressObject:(id)a3 customName:(id)a4 customNote:(id)a5 eastLongitude:(id)a6 hikeType:(int64_t)a7 length:(id)a8 northLatitude:(id)a9 originLatitude:(id)a10 originLongitude:(id)a11 positionIndex:(int64_t)a12 routeGeometry:(id)a13 southLatitude:(id)a14 totalAscent:(id)a15 totalDescent:(id)a16 tourIdentifier:(int64_t)a17 transportType:(id)a18 westLongitude:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v72;

  if (a3)
  {
    v24 = a4;
    v25 = a5;
    v26 = a6;
    v27 = a8;
    v28 = a9;
    v29 = a10;
    v30 = a11;
    v31 = a13;
    v32 = a14;
    v33 = a14;
    v34 = a15;
    v35 = a15;
    v36 = a16;
    v37 = a18;
    v38 = a18;
    v39 = a19;
    v40 = a3;
    v41 = sub_1A423BF54();
    v65 = v42;
    v66 = v41;

    v43 = a19;
    v72 = a11;
    if (a4)
    {
LABEL_3:
      v44 = sub_1A423C14C();
      v69 = v45;
      v70 = v44;

      goto LABEL_6;
    }
  }
  else
  {
    v46 = a4;
    v47 = a5;
    v48 = a6;
    v49 = a8;
    v50 = a9;
    v51 = a10;
    v52 = a11;
    v53 = a13;
    v32 = a14;
    v54 = a14;
    v34 = a15;
    v55 = a15;
    v56 = a16;
    v37 = a18;
    v57 = a18;
    v43 = a19;
    v58 = a19;
    v65 = 0xF000000000000000;
    v66 = 0;
    v72 = a11;
    if (a4)
      goto LABEL_3;
  }
  v69 = 0;
  v70 = 0;
LABEL_6:
  if (a5)
  {
    v68 = sub_1A423C14C();
    v60 = v59;

  }
  else
  {
    v68 = 0;
    v60 = 0;
  }
  if (a13)
  {
    v61 = sub_1A423BF54();
    v63 = v62;

  }
  else
  {
    v61 = 0;
    v63 = 0xF000000000000000;
  }
  return (MSUserRoute *)UserRoute.init(addressObject:customName:customNote:eastLongitude:hikeType:length:northLatitude:originLatitude:originLongitude:positionIndex:routeGeometry:southLatitude:totalAscent:totalDescent:tourIdentifier:transportType:westLongitude:)(v66, v65, v70, v69, v68, v60, a6, a7, a8, a9, a10, v72, a12, v61, v63, v32, v34, a16, a17,
                          v37,
                          v43);
}

- (MSUserRoute)initWithStore:(id)a3 addressObject:(id)a4 customName:(id)a5 customNote:(id)a6 eastLongitude:(id)a7 hikeType:(int64_t)a8 length:(id)a9 northLatitude:(id)a10 originLatitude:(id)a11 originLongitude:(id)a12 positionIndex:(int64_t)a13 routeGeometry:(id)a14 southLatitude:(id)a15 totalAscent:(id)a16 totalDescent:(id)a17 tourIdentifier:(int64_t)a18 transportType:(id)a19 westLongitude:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;

  if (a4)
  {
    v24 = a3;
    v25 = a5;
    v26 = a6;
    v27 = a7;
    v28 = a9;
    v29 = a10;
    v30 = a11;
    v31 = a12;
    v32 = a12;
    v33 = a14;
    v34 = a15;
    v35 = a16;
    v36 = a17;
    v37 = a19;
    v38 = a19;
    v39 = a20;
    v40 = a20;
    v41 = a4;
    v42 = sub_1A423BF54();
    v68 = v43;
    v69 = v42;

    if (a5)
    {
LABEL_3:
      v70 = sub_1A423C14C();
      v45 = v44;

      goto LABEL_6;
    }
  }
  else
  {
    v46 = a3;
    v47 = a5;
    v48 = a6;
    v49 = a7;
    v50 = a9;
    v51 = a10;
    v52 = a11;
    v31 = a12;
    v53 = a12;
    v54 = a14;
    v55 = a15;
    v56 = a16;
    v57 = a17;
    v37 = a19;
    v58 = a19;
    v39 = a20;
    v59 = a20;
    v68 = 0xF000000000000000;
    v69 = 0;
    if (a5)
      goto LABEL_3;
  }
  v70 = 0;
  v45 = 0;
LABEL_6:
  if (a6)
  {
    v67 = sub_1A423C14C();
    v61 = v60;

  }
  else
  {
    v67 = 0;
    v61 = 0;
  }
  if (a14)
  {
    v62 = sub_1A423BF54();
    v64 = v63;

  }
  else
  {
    v62 = 0;
    v64 = 0xF000000000000000;
  }
  v65 = sub_1A40DDEAC(a3, v69, v68, v70, v45, v67, v61, a7, a8, a9, a10, a11, v31, a13, v62, v64, a15, a16, a17,
          a18,
          v37,
          v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSUserRoute *)v65;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedUserRoute();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSUserRoute *v7;

  v6 = a3;
  v7 = self;
  sub_1A40D915C(v6, a4);

}

- (NSData)addressObject
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A40D96B8);
}

- (void)setAddressObject:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A40DE0A4);
}

- (NSString)customName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40D9A5C);
}

- (void)setCustomName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A40DE298);
}

- (NSString)customNote
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40D9E44);
}

- (void)setCustomNote:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A40DE480);
}

- (NSNumber)eastLongitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DA4C0();

  return (NSNumber *)v3;
}

- (void)setEastLongitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DE668(a3);

}

- (int64_t)hikeType
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__hikeType);
}

- (void)setHikeType:(int64_t)a3
{
  MSUserRoute *v4;

  v4 = self;
  sub_1A40DA8AC(a3);

}

- (NSNumber)length
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DAAF8();

  return (NSNumber *)v3;
}

- (void)setLength:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DE86C(a3);

}

- (NSNumber)northLatitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DAEBC();

  return (NSNumber *)v3;
}

- (void)setNorthLatitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DEA40(a3);

}

- (NSNumber)originLatitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DB280();

  return (NSNumber *)v3;
}

- (void)setOriginLatitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DEC14(a3);

}

- (NSNumber)originLongitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DB644();

  return (NSNumber *)v3;
}

- (void)setOriginLongitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DEDE8(a3);

}

- (int64_t)positionIndex
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  MSUserRoute *v4;

  v4 = self;
  sub_1A40DBA30(a3);

}

- (NSData)routeGeometry
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A40DBCCC);
}

- (void)setRouteGeometry:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A40DEFEC);
}

- (NSNumber)southLatitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DC3B0();

  return (NSNumber *)v3;
}

- (void)setSouthLatitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DF1E0(a3);

}

- (NSNumber)totalAscent
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DC774();

  return (NSNumber *)v3;
}

- (void)setTotalAscent:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DF3B4(a3);

}

- (NSNumber)totalDescent
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DCB38();

  return (NSNumber *)v3;
}

- (void)setTotalDescent:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DF588(a3);

}

- (int64_t)tourIdentifier
{
  return sub_1A40DCED8((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__tourIdentifier);
}

- (void)setTourIdentifier:(int64_t)a3
{
  MSUserRoute *v4;

  v4 = self;
  sub_1A40DCFE8(a3);

}

- (NSNumber)transportType
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DD290();

  return (NSNumber *)v3;
}

- (void)setTransportType:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DF7B0(a3);

}

- (NSNumber)westLongitude
{
  MSUserRoute *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40DD654();

  return (NSNumber *)v3;
}

- (void)setWestLongitude:(id)a3
{
  MSUserRoute *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40DF984(a3);

}

- (MSUserRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSUserRoute *)sub_1A40DDB40(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSUserRoute__addressObject), *(_QWORD *)&self->super._store[OBJC_IVAR___MSUserRoute__addressObject]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSUserRoute__routeGeometry), *(_QWORD *)&self->super._store[OBJC_IVAR___MSUserRoute__routeGeometry]);
}

@end
