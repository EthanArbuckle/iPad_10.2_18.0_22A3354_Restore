@implementation ATLocationRetriever

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  _TtC15ArchetypeEngine19ATLocationRetriever *v6;

  v5 = a3;
  v6 = self;
  sub_236A6DF40();

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC15ArchetypeEngine19ATLocationRetriever *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_236A5CA5C(v8);

}

- (_TtC15ArchetypeEngine19ATLocationRetriever)init
{
  _TtC15ArchetypeEngine19ATLocationRetriever *result;

  result = (_TtC15ArchetypeEngine19ATLocationRetriever *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
